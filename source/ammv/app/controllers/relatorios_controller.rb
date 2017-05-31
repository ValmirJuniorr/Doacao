class RelatoriosController < ApplicationController
	before_action :authenticate_user!
	before_action :set_relatorio, only: [:show, :edit, :update, :destroy, :download]

	def index
		@relatorios  = Relatorio.all.order("created_at DESC")
	end

	def show
	end

	def new
		@relatorio = Relatorio.new
	end


	def create
		if ! is_created_instiuicao
			redirect_to new_instituico_path,
				notice: 'Antes de gerar O relatório informe os dados da instituição.'
			return
		end
		@relatorio = Relatorio.new(relatorio_params)
		@relatorio.save
		@cadastros = Cadastro.where(data_ocorrencia: (@relatorio.data_inicio)..@relatorio.data_final)
		@cadastros.each  do |cadastro|
			cadastros_relatorio = CadastrosRelatorio.new
			cadastros_relatorio.buildFromCadastro cadastro
			cadastros_relatorio.relatorio_id = @relatorio.id

			if isAdesao cadastros_relatorio # deve se gerar um novo cadastro com os
				cadastros_relatorio.valor =0
				cadastros_relatorio_debito = CadastrosRelatorio.new
				cadastros_relatorio_debito.buildFromCadastro cadastro
				cadastros_relatorio_debito.codigo_ocorrencia = 60
				cadastros_relatorio.relatorio_id = @relatorio.id
				@relatorio.cadastros_relatorios << cadastros_relatorio
				@relatorio.cadastros_relatorios << cadastros_relatorio_debito
			else
				@relatorio.cadastros_relatorios << cadastros_relatorio
			end
		end
		@relatorio.generate	 @instituicao
		@relatorio.save	
		redirect_to relatorios_url

	end 

	
	def download
		content = @relatorio.registroA + @relatorio.registroD+ @relatorio.registroZ
		send_data(content, :filename => @relatorio.file_name)
	end


	private 

	def set_relatorio
		@relatorio = Relatorio.find(params[:id])
	end

	def relatorio_params
		params.require(:relatorio).permit(:data_inicio, :data_final)
	end

	def isAdesao (cadastro)
		cadastro.codigo_ocorrencia == 53
	end

	def is_created_instiuicao
		@instituicao = Instituico.first		
		@instituicao != nil
	end
	
end

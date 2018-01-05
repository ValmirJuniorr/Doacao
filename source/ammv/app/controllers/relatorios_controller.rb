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
		 if @relatorio.save
		 	redirect_to @relatorio
		 else
		 	render 'new'
		 end
	end 

	
	def download
		content = @relatorio.generate_content_file
		send_data(content, :filename => @relatorio.file_name)
	end


	private 

	def set_relatorio
		@relatorio = Relatorio.find(params[:id])
	end

	def relatorio_params
		params.require(:relatorio).permit(:data_inicio, :data_final)
	end	

	def is_created_instiuicao
		@instituicao = Instituico.first		
		@instituicao != nil
	end
	
end

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
		@relatorio = Relatorio.new(relatorio_params)
		if Ammv::INSTITUICAO == nil
			redirect_to 
		end

		@relatorio.save
		
		@cadastros = Cadastro.where(data_ocorrencia: (@relatorio.data_inicio)..@relatorio.data_final)
		

		@cadastros.each  do |cadastro|
			cadastros_relatorio = CadastrosRelatorio.new
			cadastros_relatorio.buildFromCadastro cadastro
			cadastros_relatorio.relatorio_id = @relatorio.id
			
			if isAdesao cadastros_relatorio 
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
		@relatorio.generate	
		@relatorio.save	
		redirect_to relatorios_url
	end 

	
  	def download
  		createFile
    	send_file "#{Rails.root}/app/relatorios/#{@relatorio.file_name}"
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

	def createFile		
		File.open("app/relatorios/"+self.file_name, 'w') do |reportFile|
			reportFile.puts @relatorio.registroA + @relatorio.registroD + @relatorio.registroZ		
		end
	end

end

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
		
		@cadastros = Cadastro.where(data_ocorrencia: (@relatorio.data_inicio)..@relatorio.data_final)
		

		@cadastros.each  do |cadastro|
			cadastros_relatorio = CadastrosRelatorio.new
			cadastros_relatorio.buildFromCadastro cadastro
			cadastros_relatorio.relatorio_id = @relatorio.id
			@relatorio.cadastros_relatorios << cadastros_relatorio
		end

		@relatorio.generate 1

		@relatorio.save
		redirect_to Relatorio.last
	end 

	def download
    	send_file '/app/relatorio'+@relatorio.file_name, :type=>"application/SOL", :x_sendfile=>true
  	end


	private 

	def set_relatorio
     	@relatorio = Relatorio.find(params[:id])
    end

	def relatorio_params
		params.require(:relatorio).permit(:data_inicio, :data_final)
	end

end

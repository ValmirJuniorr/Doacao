class Relatorio < ApplicationRecord
	has_many :cadastros_relatorios, :dependent => :delete_all

	#Function to Formater number decimal to n decimal with zeros
	def fnd(n, number)
		"%0#{n}d" % number
	end
	
	def generate_content_file
		i = Instituico.first	
		generateDate   = created_at.strftime("%Y%m%d")
		self.file_name = "CEX.AMMDV.#{generateDate}.SOL"		
		registroA      = "A2#{fnd(2,i.codigo_produto)}#{i.nome_instituicao}#{generateDate}#{fnd(6,self.id)}"
		registroD      = ""		
		registro_total = 2 	#2 no caso se refere ao registro do tipo e A e Registro do Tipo Z	
		valor_total    = 0
		cadastros = getCadastros()
		
		cadastros.each do |c|
			valor= c.valor.round(2)* 100 # considera apenas os dois prinmeiros digitos apos a virgula
			registroD += "\nD#{fnd(10, c.id_cliente_coelce)}#{c.digito_verificador_cliente_coelce}"+
								"#{fnd(2,c.codigo_ocorrencia)}#{c.data_ocorrencia.strftime('%m/%d/%Y')}"+
								"#{fnd(9,valor)}#{fnd(2, c.parcelas)}#{fnd(8,i.id_cliente_parceira)}"+
								"#{fnd(4, i.codigo_produto)}#{i.codigo_empresa_parceira}"
			registro_total +=1
			valor_total += valor
		end

		registroZ = "\nZ"+fnd(6,registro_total)+fnd(9,valor_total)
		registroA + registroD+ registroZ
	end


	def getCadastros 
		@cadastros = Cadastro.where(data_ocorrencia: (self.data_inicio)..self.data_final)
		cadastros_relatorios = []

		@cadastros.each  do |cadastro|
			cadastros_relatorios << cadastro
			if isAdesao cadastro # deve se gerar um novo cadastro com os
				cadastros_debito = Cadastro.new
				cadastros_debito.attributes =  cadastro.attributes
				cadastro.valor =0
				cadastros_debito.codigo_ocorrencia = 60

				cadastros_relatorios << cadastro
				cadastros_relatorios << cadastros_debito
			else
				cadastros_relatorios << cadastro
			end

		end
		cadastros_relatorios
	end

	def isAdesao (cadastro)
		cadastro.codigo_ocorrencia == 53
	end
end

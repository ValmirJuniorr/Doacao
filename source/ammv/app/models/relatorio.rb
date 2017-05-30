class Relatorio < ApplicationRecord
	has_many :cadastros_relatorios, :dependent => :delete_all



	#Function to Formater number decimal to n decimal with zeros
	def fnd(n, number)
		"%0#{n}d" % number
	end
	
	def generate
		
		generateDate   = data_inicio.strftime("%Y%m%d")
		self.file_name = "CEX.AMMDV.#{generateDate}.SOL"		
		registroA      = "A201ASSOC MARIA MAE VIDA#{generateDate}#{fnd(6,self.id)}"
		registroD      = ""
		
		totalRegister = 2 		
		valueTotal    = 0
		puts "de #{data_inicio} to #{data_final}"
		
		self.cadastros_relatorios.each do |c|
			valor= c.valor.round(2)* 100
			puts "#{c.valor} e  #{valor}"
			line = "D#{fnd(10, c.id_cliente_coelce)}#{c.digito_verificador_cliente_coelce}#{fnd(2,c.codigo_ocorrencia)}"+
					"#{c.data_ocorrencia.strftime('%m/%d/%Y')}#{fnd(9,valor)}#{fnd(2, c.parcelas)}"+
					"#{fnd(8,c.id_cliente_parceira)}#{fnd(4, c.codigo_produto)}#{c.codigo_empresa_parceira}"
			registroD += "\n#{line}"

			totalRegister +=1
			valueTotal += c.valor
		end

		registroZ = "\nZ"+fnd(6,totalRegister)+fnd(9,(valueTotal*100))

		self.valor_total        = valueTotal
		self.registro_total     = totalRegister
		self.conteudo_relatorio = registroA+registroD+registroZ

		File.open("app/relatorios/"+self.file_name, 'w') do |reportFile|
			reportFile.puts self.conteudo_relatorio			
		end
	end
end

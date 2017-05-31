class Relatorio < ApplicationRecord
	has_many :cadastros_relatorios, :dependent => :delete_all

	#Function to Formater number decimal to n decimal with zeros
	def fnd(n, number)
		"%0#{n}d" % number
	end
	
	def generate instituicao
		i = instituicao
		generateDate   = created_at.strftime("%Y%m%d")
		self.file_name = "CEX.AMMDV.#{generateDate}.SOL"		
		self.registroA      = "A2#{fnd(2,i.codigo_produto)}#{i.nome_instituicao}#{generateDate}#{fnd(6,self.id)}"
		self.registroD      = ""		
		self.registro_total = 2 	#2 no caso se refere ao registro do tipo e A e Registro do Tipo Z	
		self.valor_total    = 0
		self.cadastros_relatorios.each do |c|
			valor= c.valor.round(2)* 100 # considera apenas os dois prinmeiros digitos apos a virgula
			self.registroD += "\nD#{fnd(10, c.id_cliente_coelce)}#{c.digito_verificador_cliente_coelce}"+
								"#{fnd(2,c.codigo_ocorrencia)}#{c.data_ocorrencia.strftime('%m/%d/%Y')}"+
								"#{fnd(9,valor)}#{fnd(2, c.parcelas)}#{fnd(8,i.id_cliente_parceira)}"+
								"#{fnd(4, i.codigo_produto)}#{i.codigo_empresa_parceira}"
			self.registro_total +=1
			self.valor_total += valor
		end
		self.registroZ = "\nZ"+fnd(6,self.registro_total)+fnd(9,(self.valor_total))
	end
end

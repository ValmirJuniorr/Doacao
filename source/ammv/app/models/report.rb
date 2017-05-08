class Report < ApplicationRecord

	attr_accessor :initial_date, :end_date

	def generate
		result ="A"
		@cadastros = Cadastro.where(data_ocorrencia: (@initial_date)..@end_date)
		@cadastros.each do |cadastro|
		  puts cadastro
		end
	end	
end

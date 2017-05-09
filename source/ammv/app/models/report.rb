class Report < ApplicationRecord

	attr_accessor :initial_date, :end_date

	def generate
		result ="A201ASSOC MARIA MAE VIDA"

		@cadastros = Cadastro.all #where(data_ocorrencia: (@initial_date)..@end_date)
		@cadastros.each do |cadastro|
			line = "D#{cadastro.id_cliente_coelce}"
			result += "\n#{line}"
		end
		puts result
	end

	def testing
		fileName="app/report/CEX.AMMDV.#{Time.now.strftime("%Y%m%d")}.SOL"		
		File.open(fileName, 'w') do |f2|
			f2.puts "Só sucesso";
		end
    end
end
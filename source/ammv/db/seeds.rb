# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
User.create(email: 'admin@admin', username: 'admin', role: 'admin',
	password: 'admin123', password_confirmation: 'admin123')
30.times do |i|
	  	Cadastro.create!(
	  		id_cliente_coelce: Faker::Number.number(6),
			digito_verificador_cliente_coelce: Faker::Number.number(1),
			codigo_ocorrencia: 53,
			data_ocorrencia: Faker::Date.between(180.days.ago, Date.today),
			valor: Faker::Number.between(5, 100),
			parcelas: 0,
			livre: Faker::Lorem.characters(10),
			user_id: 1
	  	)
end
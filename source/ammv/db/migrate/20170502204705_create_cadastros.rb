class CreateCadastros < ActiveRecord::Migration[5.0]
  def change
    create_table :cadastros do |t|
      t.string :id_cliente_coelce
      t.string :digito_verificador_cliente_coelce
      t.string :codigo_ocorrencia
      t.date :data_ocorrencia
      t.float :valor
      t.string :parcelas
      t.string :id_cliente_parceira
      t.string :codigo_produto
      t.string :codigo_empresa_parceira
      t.text :livre

      t.timestamps
    end
  end
end

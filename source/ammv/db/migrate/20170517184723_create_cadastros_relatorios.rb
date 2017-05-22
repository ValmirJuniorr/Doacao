class CreateCadastrosRelatorios < ActiveRecord::Migration[5.0]
  def change
    create_table :cadastros_relatorios do |t|
      t.integer :id_cliente_coelce
      t.integer :digito_verificador_cliente_coelce
      t.integer :codigo_ocorrencia
      t.date :data_ocorrencia
      t.integer :valor
      t.integer :parcelas
      t.integer :id_cliente_parceira
      t.integer :codigo_produto
      t.integer :codigo_empresa_parceira
      t.text :livre
      t.references :relatorio, foreign_key: true

      t.timestamps
    end
  end
end

class CreateInstituicos < ActiveRecord::Migration[5.0]
  def change
    create_table :instituicos do |t|
      t.string :nome_instituicao
      t.integer :id_cliente_parceira
      t.integer :codigo_produto
      t.integer :codigo_empresa_parceira
      t.timestamps
    end
  end
end

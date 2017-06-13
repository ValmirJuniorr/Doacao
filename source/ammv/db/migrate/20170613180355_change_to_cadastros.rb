class ChangeToCadastros < ActiveRecord::Migration[5.0]
  def change
    remove_column :cadastros, :id_cliente_parceira
    remove_column :cadastros, :codigo_produto
    remove_column :cadastros, :codigo_empresa_parceira

    remove_column :cadastros_relatorios, :id_cliente_parceira
    remove_column :cadastros_relatorios, :codigo_produto
    remove_column :cadastros_relatorios, :codigo_empresa_parceira
  end
end

class AddCadastroIdToCadastrosRelatorios < ActiveRecord::Migration[5.0]
  def change
    add_column :cadastros_relatorios, :cadastro_id, :integer
  end
end

class DropCadastroRelatorioTable < ActiveRecord::Migration[5.0]
  def up
    drop_table :cadastros_relatorios
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end

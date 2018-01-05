class ChangeCollumsRelatorioTable < ActiveRecord::Migration[5.0]
  def change
  	remove_column :relatorios, :valor_total, :float
    remove_column :relatorios, :registro_total, :integer
    remove_column :relatorios, :registroA, :string
  	remove_column :relatorios, :registroD, :text
  	remove_column :relatorios, :registroZ, :string
  end
end

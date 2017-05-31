class AddColumsToRelatorio < ActiveRecord::Migration[5.0]
  def change
    add_column :relatorios, :file_name, :string
    add_column :relatorios, :valor_total, :float
    add_column :relatorios, :registrosTotal, :integer
  end
end

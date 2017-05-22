class ChangeRegistrosTotalToRelatorio < ActiveRecord::Migration[5.0]
  def change
  	rename_column :relatorios, :registrosTotal, :registro_total
  end
end

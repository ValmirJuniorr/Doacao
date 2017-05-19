class CreateRelatorios < ActiveRecord::Migration[5.0]
  def change
    create_table :relatorios do |t|
      t.date :data_geracao
      t.date :data_inicio
      t.date :data_final

      t.timestamps
    end
  end
end

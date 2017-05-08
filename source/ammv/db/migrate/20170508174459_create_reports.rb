class CreateReports < ActiveRecord::Migration[5.0]
  def change
    create_table :reports do |t|
      t.string :gerenation_date
      t.date :initial_date
      t.date :end_date

      t.timestamps
    end
  end
end

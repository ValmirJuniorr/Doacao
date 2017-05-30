class ChangeFloatForValor < ActiveRecord::Migration[5.0]
  def change
  	change_column(:cadastros_relatorios, :valor, :float)
  end
end

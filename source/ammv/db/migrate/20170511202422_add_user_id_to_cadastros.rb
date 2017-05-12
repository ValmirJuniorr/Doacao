class AddUserIdToCadastros < ActiveRecord::Migration[5.0]
  def change
    add_column :cadastros, :user_id, :integer
    add_index :cadastros, :user_id
  end
end

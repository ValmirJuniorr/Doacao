class ChangeCollumsToRelatorio < ActiveRecord::Migration[5.0]
  def change
  	remove_column :relatorios, :data_geracao
  	remove_column :relatorios, :conteudo_relatorio
  	add_column :relatorios, :registroA, :string
  	add_column :relatorios, :registroD, :text
  	add_column :relatorios, :registroZ, :string
  end
end
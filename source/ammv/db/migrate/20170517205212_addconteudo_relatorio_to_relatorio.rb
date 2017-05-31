class AddconteudoRelatorioToRelatorio < ActiveRecord::Migration[5.0]
  def change
  	add_column :relatorios, :conteudo_relatorio, :text
  end
end

class CadastrosRelatorio < ApplicationRecord
  belongs_to :relatorio  	
  

  def buildFromCadastro (cadastro)
  	self.attributes = cadastro.attributes.except('id','user_id')
  end
end

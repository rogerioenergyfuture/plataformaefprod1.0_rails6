class UserNormal < ApplicationRecord
  belongs_to :user
  enum status: [ :'ativo', :'inativo']
  enum typerole: [ :'admin', :'avaliador',:'visualizador']
  belongs_to :companypower
  #belongs_to :evaluation #ATENCAO TESTE
  
  
end

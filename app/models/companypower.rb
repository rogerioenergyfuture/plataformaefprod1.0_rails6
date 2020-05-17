class Companypower < ApplicationRecord
    
  enum category: [ :"Gerador Conteúdo",:"Geração e Transmissão",:"Distribuição" ] 
  enum status: [ :'ativo', :'inativo'] 
  
  validates :name, uniqueness: {message: "já cadastrado" }
  validates_presence_of :name
  validates_presence_of :category
end

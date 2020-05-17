class Cargo < ApplicationRecord
    
  enum status: [ :'ativo', :'inativo'] 
end

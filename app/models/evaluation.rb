class Evaluation < ApplicationRecord
  belongs_to :sum_evaluation
  belongs_to :user_normal
  belongs_to :project
  enum statusbloqueio:[:'Livre',:'Bloqueado'] 
end

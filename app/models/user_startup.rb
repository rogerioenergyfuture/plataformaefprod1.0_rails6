class UserStartup < ApplicationRecord
  belongs_to :user
#  belongs_to :cargo
#  belongs_to :city
#  belongs_to :state
  
  enum status: [ :'ativo', :'inativo'] 
  enum enquadramentoppf: [ :'Startup',:'Pequena e Média Empresa',:'Corporação',:'Centro de Pesquisa',:'Pesquisador Individual' ]
  enum tipodepessoappf: [:'Pessoa Física',:'Pessoa Jurídica']
  enum jparticipoudeoutrachamadadeprojetosdepdestartupsppf: [:'Sim, 1',:'Sim, 2',:'Sim, 3',:'Sim, mais de 5',:'Não']
  #enum current_phaseppf: [:'Entrada de Cadastros',:'Inbox - Startups',:'Administrativa',:'Técnica',:'Concluído']
#  enum current_phaseppf: [:'6989724',:'7794642',:'7794630',:'7794641',:'6989726']
#  enum leuasinformacoessobreasconcessionariasppf: [:'Sim','Não'] 
end

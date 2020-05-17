class Project < ApplicationRecord
  belongs_to :user_startup
  has_many :evaluations
  
  enum quantidadedefuncionariosppf: [ :'2 a 5',:'6 a 10',:'11 a 20',:'101 a 500',:'Mais de 500',:'N',:'NA'], _suffix: true 
  enum kindppf: [ :'Produto', :'Serviço',:'Ambos'] 
  enum categoriappf: [:'Não sei dizer',:'Renováveis e Storage',:'Smart Grid and Meter',:'Gestão Energética',
                      :'Serviços a Clientes de Distribuição',:'Performance e Digitalização',
                      :'Novos Negócios em Geração e Transmissão'], _suffix: true
                      
  enum estagiocadeiainovacaoppf: [:'Pesq. Básica Dirigida',:'Pesq. Aplicada',:'Design Experimental',
                                  :'Cabeça de Série',:'Lote Pioneiro',:'Inserção no Mercado',:'Não sei dizer'], _suffix: true
                                  
                                   
                                   
  enum adotapraticasdegestaoppf: [:'Nunca adotado',:'Ocasionalmente adotado',:'Recorrentemente adotado'], _suffix: true
  enum processosdeoperacaoegestaoppf: [:'Nunca adotado',:'Ocasionalmente adotado',:'Recorrentemente adotado'], _suffix: true
  enum pesquisatecnologiasnaareadesuaatividadeppf: [:'Nunca adotado',:'Ocasionalmente adotado',:'Recorrentemente adotado'], _suffix: true
  enum avaliaoimpactodainovacaoppf: [:'Nunca adotado',:'Ocasionalmente adotado',:'Recorrentemente adotado'], _suffix: true
  enum executaparceriaseintercambiosppf: [:'Nunca adotado',:'Ocasionalmente adotado',:'Recorrentemente adotado'], _suffix: true
  enum valiaproblemasambientalppf: [:'Nunca adotado',:'Ocasionalmente adotado',:'Recorrentemente adotado'], _suffix: true
  enum definemetricasquantitativasparaaferirppf: [:'Nunca adotado',:'Ocasionalmente adotado',:'Recorrentemente adotado'], _suffix: true
  enum ofereceaoscolaboradoresmetodoscontroleegestaoppf: [:'Nunca adotado',:'Ocasionalmente adotado',:'Recorrentemente adotado'], _suffix: true  
  #enum projetojarecebeualgumaporteppf: [:'Sim, P&D',:'Sim, Investidor Anjo',:'Sim, Aceleração',:'Sim, Family Office',
  #                                   :'Sim, Crowdfunding',:'Sim, Venture Capital',:'Sim, Seed Money',
  #                                   :'Sim, outros',:'Não']
  enum qualvalortotaldosaportesrecebidosppf:[:'0 a 200 mil Reais',:'201 mil a 500 mil',:'501 a 1 milhão',
                                            :'1 a 2 milhões',:'2 a 3 milhões',:'mais de 3 milhões',:'N',:'NA'], _suffix: true   
  enum qualeaquantianecessariapararealizacaoppf: [:'Até 100 mil Reais',:'Entre 100 e 400 mil',:'Entre 400 e 1 milhão',
                                                 :'Entre 1 milhão e 3 milhões',:'Mais de 3 milhões',:'N',:'NA'], _suffix: true  
  enum asuasolucaojatemconcorrentesnomercadoppf: [:True,:False]
  
  enum quantosconcorrentesppf: [:'1 a 3',:'4 a 7',:'8 a 10',:'Mais de 10',:'Não',:'NA']
  enum quaismarcosjaforamatingidospeloprojetoppf: [:'Problem/Solution Fit - Já está bem claro o problema e como vamos resolver.',
                                                :'Product/Market Fit - O púbico alvo, modelo de custo e modelo de receita já estão definidos.',
                                                :'Escala - É necessário apenas o investimento para produzir e vender mais.',
                                                :'Break Even - A receita do negócio hoje não é menor que o custo de operação.',
                                                :'Nenhum anterior.',:"Entre 13 a 24",:'N',:'NA'], _suffix: true 
  enum qualeaestimativadetempoparaaconclusaoppf: [:'Entre 1 e 6 meses',:'Entre 7 e 12',:'Entre 13 a 24',:'Mais de 24',:'N',:'NA'], _suffix: true 
  
  
  
  
  
  
  
end


prs=Project.all 
puts prs.count
prs.each do |proj|
 user_normals=UserNormal.where(typerole:"avaliador")
  sum_evaluation=SumEvaluation.all
  user_normals.each do |user_normal|
    #puts user_normal.id
    #puts sum_evaluation[0].id
    #puts proj.id
  av=Evaluation.where(project_id: proj.id, user_normal_id:user_normal.id) 
  #puts av.count
  if av==[]
    Evaluation.create!(
    project_id:proj.id,
    sum_evaluation:sum_evaluation[0],
    user_normal:user_normal,
    statusbloqueio:0,
    favorito:false,
    notapergunta1:0,
    notapergunta2:0,
    notapergunta3:0,
    notapergunta4:0,
    comments:"",
    pergunta1:"AVALIAÇÃO DA OPORTUNIDADE",
    pergunta2:"AVALIAÇÃO DA SOLUÇÃO",
    pergunta3:"AVALIAÇÃO DA EXECUTORA",
    pergunta4:"AVALIAÇÃO DOS CRITÉRIOS ANEEL"   
   ) 
  puts "criou avaliação"
  else
     av=Evaluation.where(id: av[0].id) 
     av[0].project_id=proj.id
     av[0].sum_evaluation=sum_evaluation[0]
     av[0].user_normal=user_normal
=begin     
     av[0].statusbloqueio=0
     av[0].favorito=false
     av[0].notapergunta1=0
     av[0].notapergunta2=0
     av[0].notapergunta3=0
     av[0].notapergunta4=0
     av[0].comments=""
     av[0].pergunta1="AVALIAÇÃO DA OPORTUNIDADE"
     av[0].pergunta2="AVALIAÇÃO DA SOLUÇÃO"
     av[0].pergunta3="AVALIAÇÃO DA EXECUTORA",
     av[0].pergunta4="AVALIAÇÃO DOS CRITÉRIOS ANEEL" 
=end     
     av[0].save
  end
 end 
end 



=begin

  s=State.where(name:"Rio De Janeiro") 
  c=City.where(name:"Rio de Janeiro")
  cg=Cargo.last
  User.create!(email: "startup2@gmail.com",password:"12345678",typeclasse:1)
  u=User.last
  UserStartup.create!(user:u,name:"Startup2",cargo:cg,status:0,state_id:s[0].id,city_id:c[0].id)  

  
  
  puts "Gerando o Project Energy Future [OK]" 
  cp=Companypower.first
  uss=UserStartup.last
  puts cp.name
  puts uss.name
  Project.create!(name: 'name2', title: 'title2', 
  user_startup_id: uss.id,
  quantidadedefuncionariosppf: 0, 
  resumoppf:'', 
  detalhesppf: '', 
  kindppf: 0, 
  descricaoppf: '', 
  categoriappf: 0,
  qualdorpretenderesolverppf: 0, 
  companypower_id: cp.id, 
  adotapraticasdegestaoppf: 0, 
  processosdeoperacaoegestaoppf: 0, 
  pesquisatecnologiasnaareadesuaatividadeppf: 0, 
  avaliaoimpactodainovacaoppf: 0, 
  executaparceriaseintercambiosppf: 0, 
  valiaproblemasambientalppf: 0, 
  definemetricasquantitativasparaaferirppf: 0, 
  ofereceaoscolaboradoresmetodoscontroleegestaoppf: 0,
  projetojarecebeualgumaporteppf: 0, 
  qualvalortotaldosaportesrecebidosppf: 0, 
  qualeaquantianecessariapararealizacaoppf: 0, 
  qualamaiordificuldadequeoseuprojetoenfrentahojeppf: 0, 
  asuasolucaojatemconcorrentesnomercadoppf: 0, 
  quantosconcorrentesppf: 0, 
  quaismarcosjaforamatingidospeloprojetoppf: 0, 
  qualeaestimativadetempoparaaconclusaoppf: 0, 
  estagiocadeiainovacaoppf: 0)
  puts "Gerando o Project Energy Future [OK]"
=end
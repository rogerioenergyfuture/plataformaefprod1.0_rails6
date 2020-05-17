module WelcomeHelper
 
def inicio
 require 'uri' 
 autorizacao='Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJ1c2VyIjp7ImlkIjo4NzkzOTksImVtYWlsIjoidGVhbUBtYWtlYWIuY29tIiwiYXBwbGljYXRpb24iOjU2MDY3fX0.wZbNcc6rsE7nPQk52vVWjgTbu0vlsONkZ_RNX1m94tfwEaB4b8neZapuVWtTyTlnW5FjbX75mWqOFk8_BksFcg'    
 url = URI("https://api.pipefy.com/graphql")
 [autorizacao,url] 
end

def cleancampos(pipefy_id,razaosocial,enquadrament,quais,japarticipou,
         quantfunatuante,tipopess,email,datanasc,nomesobrenom,phase_id,tokenid,pestimativa,pquaismarcos,
         ptemconcorrentesb,pquantosconcorrentes,pdificuldade,pquantianecessaria,paportesrecebidos,pquaisinstituicoes,precebeualgumtipoaporte,
         pconcessarias,pcontrolegestao,pmetricasquantitativas,pproblemasambientais,pparceriasintercambios,
         pavaliaimpactoinovacao,ppesquisatecnologias,pprotocoloresgistro,padotapraticasgestao,
         presolverdorsetor,pestagiocadeiainovacao,pcategoria,pdescricao,pprodutoservico,pdetalhesprojeto,
         presumoprojeto,pnomeprojeto,ptelfixocontato,pcertificacoes,pendereco,pcnpj,pnomefantasia,ptipopessoa,ptitle,temprojetos)
         
      pipefy_id=""
      razaosocial=""
      quais=""
      japarticipou=false
      quantfunatuante=5
      enquadrament=""
      datanasc=""
      nomesobrenom=""
      tokenid=""
      pestimativa=""
      pquaismarcos=""
      ptemconcorrentesb=false
      pquantosconcorrentes=4
      pdificuldade=""
      pquantianecessaria=""
      paportesrecebidos=""
      pquaisinstituicoes=""
      precebeualgumtipoaporte=""
      pconcessarias=""
      pcontrolegestao=""
      pmetricasquantitativas=""
      pproblemasambientais=""
      pparceriasintercambios=""
      pavaliaimpactoinovacao=""
      ppesquisatecnologias=""
      pprotocoloresgistro=""
      padotapraticasgestao=""
      presolverdorsetor=""
      pestagiocadeiainovacao=""
      pcategoria=""
      pdescricao=""
      pprodutoservico=""
      pdetalhesprojeto=""
      presumoprojeto=""
      pnomeprojeto=""
      ptelfixocontato=""
      pcertificacoes=""
      pendereco=""
      pcnpj=""
      pnomefantasia=""
      ptipopessoa=""
      ptitle=""         
      temprojetos=""   
    
end 

def getteste(cursorpipe)
 arraycadastros=[]
 get_cadastros(cursorpipe,arraycadastros)
end

def setvalormenos(valor)
 if valor=='-'
  valor='N'
 end 
 valor
end 

def get_cadastros(cursorpipe,arraycadastros)
require 'net/http'
require 'json'
ini=[]
ini=inicio
http = Net::HTTP.new(ini[1].host, ini[1].port)
http.use_ssl = true
request = Net::HTTP::Post.new(ini[1])
request["authorization"] = ini[0]
request["content-type"] = 'application/json'
queryp="{\"query\":\"{ phase(id: 6989724) { id name cards_count cards(first: 30, after: \\\"#{cursorpipe}\\\"){ pageInfo { endCursor hasNextPage } edges { node { id title current_phase { id }fields {name value}subtitles{name value}}}}}}\"}"
request.body=queryp
response = http.request(request)
preparadadoscadastros(JSON.parse(response.read_body),arraycadastros)
end


def preparadadoscadastros(results,arraycadastros)
resultados=[]
resultados1=[]
resultados2=[]
pageinfo=[] 
email=""
tipopess=""
enquadrament=""
resultados1=results["data"]
resultados=resultados1["phase"]
resultados1=resultados["cards"]
pageinfo=resultados1["pageInfo"]
endcursor=pageinfo["endCursor"]
hasnextpage=pageinfo["hasNextPage"]
puts endcursor
puts hasnextpage

resultados=resultados1["edges"]
 resultados.each do |resultado|
   resultados1=resultado["node"]
   pipefy_id=resultados1["id"]
   phase_id=resultados1["current_phase"]
   resultados2=resultados1["fields"] 
   resultados2.each do |resultado2|
     #if resultado2["name"]=="Cidade, Estado onde o projeto será executado"
      #cidadeestato=resultado2["value"]
     if resultado2["name"]=="E-mail"
      email=resultado2["value"]
#     elsif resultado2["name"]=="Cargo"
#      carg=resultado2["value"]
      elsif resultado2["name"]=="Tipo de Pessoa"
      tipopess=resultado2["value"]   
      elsif resultado2["name"]=="Enquadramento"
      enquadrament=resultado2["value"]     
     end 
    end 
#if (enquadrament!=4)and(enquadrament!='Pesquisador Individual')
   #testa=[email,pipefy_id,tipopess,enquadrament,phase_id]
   testa=[email,tipopess,enquadrament]
   arraycadastros.push(testa)
   #cidadeestato=""
   email=""
   #carg=""
   #pipefy_id=""
   tipopess=""
   #phase_id=""
   enquadrament=""
#end   
 end
 if hasnextpage==true
  get_cadastros(endcursor,arraycadastros)
 else 
  get_inscricoes('WzYxNTY0Njdd',arraycadastros)     
 end

end



def get_inscricoes(cursorpipe,arraycadastros)
require 'net/http'
require 'json'
ini=[]
ini=inicio
http = Net::HTTP.new(ini[1].host, ini[1].port)
http.use_ssl = true
request = Net::HTTP::Post.new(ini[1])
request["authorization"] = ini[0]
request["content-type"] = 'application/json'
queryp="{\"query\":\"{ phase(id: 8208905) { id name cards_count cards(first: 30, after: \\\"#{cursorpipe}\\\"){ pageInfo { endCursor hasNextPage } edges { node { id title current_phase { id }fields {name value}subtitles{name value}}}}}}\"}"
request.body=queryp
response = http.request(request)
 gravaalterauserprojetos(JSON.parse(response.read_body),arraycadastros)

end

def gravaalterauserprojetos(results,arraycadastros)
 puts 'GRAVA PROJETOS'
 
resultados=[]
resultados1=[]
resultados2=[]
pageinfo=[] 
#cidadeestato=[]
razaosocial=""
quais=""
quantfunatuante=""
pipefy_id=""
tipopess=""
japarticipou=false

#carg=""
email=""
datanasc=""
nomesobrenom=""
phase_id=""
tokenid=""
pestimativa=""
pquaismarcos=""
ptemconcorrentesb=false
pquantosconcorrentes=4
pdificuldade=""
pquantianecessaria=""
paportesrecebidos=""
paportesquaisinstituicoes=""
projetojarecebeualgumaporteppf=""
pconcessarias=""
pcontrolegestao=""
pmetricasquantitativas=""
pproblemasambientais=""
pparceriasintercambios=""
pavaliaimpactoinovacao=""
ppesquisatecnologias=""
pprotocoloresgistro=""
padotapraticasgestao=""
pquantprofissionais=""
presolverdorsetor=""
pestagiocadeiainovacao=""
pcategoriafinal=""
pdescricao=""
pprodutoservico=""
pdetalhesprojeto=""
presumoprojeto=""
pnomeprojeto=""
ptelfixocontato=""
pcertificacoes=""
pendereco=""
pcnpj=""
pnomefantasia=""
ptipopessoa=""
ptitle=""
temprojetos=""

resultados1=results["data"]
resultados=resultados1["phase"]
resultados1=resultados["cards"]
pageinfo=resultados1["pageInfo"]
endcursor=pageinfo["endCursor"]
hasnextpage=pageinfo["hasNextPage"]
puts endcursor
puts hasnextpage
resultados=resultados1["edges"]
puts resultados.count
puts resultados

 resultados.each do |resultado|
   resultados1=resultado["node"]
   pipefy_id=resultados1["id"]
   phase_id=resultados1["current_phase"]
    resultados2=resultados1["fields"]
    resultados2.each do |resultado2|
     if resultado2["name"]=="Razão Social"
      razaosocial=resultado2["value"]
     elsif resultado2["name"]=="Qual(is)?"
      quais=resultado2["value"]
     elsif resultado2["name"]=="Já participou de outra chamada de projetos de P&D e Startups? "
      japarticipou=resultado2["value"] 
     elsif resultado2["name"]=="Quantos profissionais atuam ou atuarão no projeto?"
      quantfunatuante=resultado2["value"]
     elsif resultado2["name"]=="E-mail"
      email=resultado2["value"]
     elsif resultado2["name"]=="Data de nascimento"
      datanasc=resultado2["value"]
     elsif resultado2["name"]=="Nome Completo"
      nomesobrenom=resultado2["value"]
     elsif resultado2["name"]=="Token de ID"
      tokenid=resultado2["value"]
     elsif resultado2["name"]=="Qual é a estimativa de tempo para a conclusão do projeto?"
      pestimativa=resultado2["value"]  
     elsif resultado2["name"]=="Quais marcos já foram atingidos pelo projeto?"
      pquaismarcos=resultado2["value"]      
     elsif resultado2["name"]=="O projeto tem concorrentes?"
      ptemconcorrentesb=resultado2["value"] 
     elsif resultado2["name"]=="Quantos?"
      if ptemconcorrentesb==true
       pquantosconcorrentes=resultado2["value"] 
      else
        pquantosconcorrentes=4 
      end
     elsif resultado2["name"]=="Qual a maior dificuldade que o seu projeto enfrenta hoje?"
      pdificuldade=resultado2["value"]
     elsif resultado2["name"]=="Qual é a quantia necessária para realização do projeto?"
      pquantianecessaria=resultado2["value"]      
     elsif resultado2["name"]=="Qual valor total dos aportes recebidos pelo projeto? "
      paportesrecebidos=resultado2["value"]      
     elsif resultado2["name"]=="De qual(is) instituição(ões)?"
      paportesquaisinstituicoes=resultado2["value"]    
     elsif resultado2["name"]=="O projeto já recebeu algum tipo de aporte? "
      projetojarecebeualgumaporteppf=resultado2["value"]
     elsif resultado2["name"]=="Em qual concessionária seu projeto se encaixará melhor?"
      pconcessarias=resultado2["value"]  
     elsif resultado2["name"]=="Oferece aos colaboradores métodos e ferramentas como softwares de controle e gestão?"
      pcontrolegestao=resultado2["value"]
     elsif resultado2["name"]=="Define métricas quantitativas para aferir o resultado obtido com a inovação?"
      pmetricasquantitativas=resultado2["value"]   
     elsif resultado2["name"]=="Avalia problemas ambientais em seus projetos?"
      pproblemasambientais=resultado2["value"]      
     elsif resultado2["name"]=="Executa parcerias, intercâmbios e cooperações formais com instituições do setor elétrico?"
      pparceriasintercambios=resultado2["value"]   
     elsif resultado2["name"]=="Avalia o impacto da inovação em clientes, fornecedores e empreendimentos parceiros?"
      pavaliaimpactoinovacao=resultado2["value"]
     elsif resultado2["name"]=="Pesquisa tecnologias na área de sua atividade?"
      ppesquisatecnologias=resultado2["value"]     
     elsif resultado2["name"]=="Protocola e registra inovações usando um processo estruturado?"
      pprotocoloresgistro=resultado2["value"]      
     elsif resultado2["name"]=="Adota práticas de Gestão de Propriedade Intelectual?"
      padotapraticasgestao=resultado2["value"]       
     elsif resultado2["name"]=="Quantos profissionais atuam ou atuarão no projeto?"
      pquantprofissionais=resultado2["value"]      
     elsif resultado2["name"]=="Pretende resolver qual demanda (dor) do setor elétrico?"
      presolverdorsetor=resultado2["value"]  
     elsif resultado2["name"]=="Estágio da cadeia de inovação"
      pestagiocadeiainovacao=resultado2["value"]      
     elsif resultado2["name"]=="Categoria do Energy Future"
      pcategoriafinal=resultado2["value"]   
     elsif resultado2["name"]=="Descreva seu produto e/ou serviço."
      pdescricao=resultado2["value"]      
     elsif resultado2["name"]=="Produto e/ou serviço?"
      pprodutoservico=resultado2["value"] 
     elsif resultado2["name"]=="Detalhes do Projeto"
      pdetalhesprojeto=resultado2["value"]      
     elsif resultado2["name"]=="Resumo do projeto"
      presumoprojeto=resultado2["value"]  
     elsif resultado2["name"]=="Nome do Projeto"
      pnomeprojeto=resultado2["value"]      
     elsif resultado2["name"]=="Telefone fixo para contato"
      ptelfixocontato=resultado2["value"]       
     elsif resultado2["name"]=="Possui certificação? Quais?"
      pcertificacoes=resultado2["value"]      
     elsif resultado2["name"]=="Endereço da Instituição"
      pendereco=resultado2["value"]
     #elsif resultado2["name"]=="Qual sua prioridade de investimento para garantir o sucesso do projeto?"
      #puts resultado2["value"]
     elsif resultado2["name"]=="CNPJ"
      pcnpj=resultado2["value"]      
     elsif resultado2["name"]=="Nome Fantasia"
      pnomefantasia=resultado2["value"]   
     elsif resultado2["name"]=="Tipo de Pessoa"
      ptipopessoa=resultado2["value"]      
     elsif resultado2["name"]=="title"
      ptitle=resultado2["value"]
      
      elsif resultado2["name"]=="A Instituição tem projetos de P&D além do que está sendo inscrito no Energy Future?"
        temprojetos=resultado2["value"]
     end
     
    end 
   
    
     retorno=emailtipopessenquadrament(arraycadastros,email)
     if retorno!=[]
     #cidadeestato=retorno[1] 
     #carg=retorno[2]
     tipopess=retorno[1]
     enquadrament=retorno[2]
     end
#begin
if projetojarecebeualgumaporteppf=='Não'
 paportesquaisinstituicoes='Não'
end 
#if tokenid=="2AGX"
#puts "##################################"
#puts tokenid
#puts "email:"+retorno[0]
#puts projetojarecebeualgumaporteppf
#puts pnomeprojeto
#puts pcategoriafinal
#puts pnomefantasia
#puts quantfunatuante
#puts "##################################"
#end
#end
#puts "Enquadramento:"+retorno[2]
#puts "Tipo pessoa:"+retorno[1]
#puts  nomesobrenom
#=begin
     puts 'GRAVA PROJETOS3'
      criaalterauserstartupprojetocargo(pipefy_id,razaosocial,enquadrament,quais,japarticipou,
         quantfunatuante,tipopess,email,datanasc,nomesobrenom,phase_id,tokenid,pestimativa,pquaismarcos,
         ptemconcorrentesb,pquantosconcorrentes,pdificuldade,pquantianecessaria,paportesrecebidos,paportesquaisinstituicoes,projetojarecebeualgumaporteppf,
         pconcessarias,pcontrolegestao,pmetricasquantitativas,pproblemasambientais,pparceriasintercambios,
         pavaliaimpactoinovacao,ppesquisatecnologias,pprotocoloresgistro,padotapraticasgestao,
         presolverdorsetor,pestagiocadeiainovacao,pcategoriafinal,pdescricao,pprodutoservico,pdetalhesprojeto,
         presumoprojeto,pnomeprojeto,ptelfixocontato,pcertificacoes,pendereco,pcnpj,pnomefantasia,ptipopessoa,ptitle,temprojetos)

     puts 'GRAVA PROJETOS4'
      cleancampos(pipefy_id,razaosocial,enquadrament,quais,japarticipou,
         quantfunatuante,tipopess,email,datanasc,nomesobrenom,phase_id,tokenid,pestimativa,pquaismarcos,
         ptemconcorrentesb,pquantosconcorrentes,pdificuldade,pquantianecessaria,paportesrecebidos,paportesquaisinstituicoes,projetojarecebeualgumaporteppf,
         pconcessarias,pcontrolegestao,pmetricasquantitativas,pproblemasambientais,pparceriasintercambios,
         pavaliaimpactoinovacao,ppesquisatecnologias,pprotocoloresgistro,padotapraticasgestao,
         presolverdorsetor,pestagiocadeiainovacao,pcategoriafinal,pdescricao,pprodutoservico,pdetalhesprojeto,
         presumoprojeto,pnomeprojeto,ptelfixocontato,pcertificacoes,pendereco,pcnpj,pnomefantasia,ptipopessoa,ptitle,temprojetos)
#=end     
 end

 puts 'fim2'
 puts endcursor
 puts hasnextpage
 puts 'fim2'
 if hasnextpage==true
  get_inscricoes(endcursor,arraycadastros)
 end 

end



   

def criaalterauserstartupprojetocargo(ppipefy_id,razaosocial,enquadrament,quais,japarticipou,
        quantfunatuante,tipopess,pemail,datanasc,nomesobrenom,phase_id,tokenid,pestimativa,pquaismarcos,
        ptemconcorrentesb,pquantosconcorrentes,pdificuldade,pquantianecessaria,paportesrecebidos,paportesquaisinstituicoes,projetojarecebeualgumaporteppf,
        pconcessarias,pcontrolegestao,pmetricasquantitativas,pproblemasambientais,pparceriasintercambios,
        pavaliaimpactoinovacao,ppesquisatecnologias,pprotocoloresgistro,padotapraticasgestao,
        presolverdorsetor,pestagiocadeiainovacao,pcategoriafinal,pdescricao,pprodutoservico,pdetalhesprojeto,
        presumoprojeto,pnomeprojeto,ptelfixocontato,pcertificacoes,pendereco,pcnpj,pnomefantasia,ptipopessoa,ptitle,temprojetos)


=begin
if (cidadeestato !="")and(cidadeestato !=" ")and(cidadeestato !=nil)and(cidadeestato !=[])
  cidadeestato1=cidadeestato.tr('[]', '').split(',').map(&:to_str)
  c=City.where(name:cidadeestato1[0].strip)  
 if (cidadeestato1[0].strip !="")and(cidadeestato1[0].strip !="ManausManaus")and(cidadeestato1[0].strip !=" ")and
          (cidadeestato1[0].strip !="Campina")
  c=City.where(name:cidadeestato1[0].strip)  
  s=State.where(name:cidadeestato1[1].strip) 
  pcity=City.find(c[0].id) 
  pstate=State.find(s[0].id) 
 elsif (cidadeestato1[0].strip =="ManausManaus")
  c=City.where(name:"Manaus")  
  s=State.where(name:"Amazonas") 
  pcity=City.find(c[0].id) 
  pstate=State.find(s[0].id)  
 elsif (cidadeestato1[0].strip =="Campina")
  c=City.where(name:"Campinas")  
  s=State.where(name:"São Paulo") 
  pcity=City.find(c[0].id) 
  pstate=State.find(s[0].id)   
 elsif (cidadeestato1[0].strip ==" ")or(cidadeestato1[0].strip =="")
  c=City.where(name:"São Paulo")  
  s=State.where(name:"São Paulo") 
  pcity=City.find(c[0].id) 
  pstate=State.find(s[0].id) 
 end 
else
  c=City.where(name:"São Paulo")  
  s=State.where(name:"São Paulo") 
  pcity=City.find(c[0].id) 
  pstate=State.find(s[0].id) 
end 
=end 

=begin
if carg!=""
cargo=Cargo.where(name:carg)
 if cargo==[] 
   #puts "deve criar cargo #{carg}"
   Cargo.create!(name:carg, status: 0)
   pcarg=Cargo.last
 else
  #puts "vai alterar cargo"
   cargo[0].name=cargo[0].name
   cargo[0].status=cargo[0].status
   cargo[0].save
   pcarg=Cargo.find(cargo[0].id)
   
 end
 else
  cargo=Cargo.where(name:"Analista/Especialista")
end 
=end
#if tipopess==""
#  tipopess=1
#end
#if (enquadrament=="")or(enquadrament==nil)
#  enquadrament=0
#end
#puts "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
#puts "Enquadramento:"+enquadrament
#puts "Tipo pessoa:"+tipopess
#puts "email:"+pemail
#puts tokenid
#puts "!!!!!!!!!!!!!!!!!!!!!!!!!!!"
if (pemail.downcase!="")and(enquadrament!="")and(tipopess!="")
 user=User.where(email:pemail.downcase)and(enquadrament!=nil)
#=begin 
 if user==[] 
   puts "deve criar user #{pemail.downcase}"
   User.create!(email: pemail.downcase,password:"12345678",typeclasse:1)
   user=User.last
   puts "deve criar userstartup #{pemail.downcase}"
   UserStartup.create!(user_id:user.id,name:nomesobrenom,status:0,pipefyid:ppipefy_id,nomefantasiappf:pnomefantasia,
   enquadramentoppf:enquadrament,tipodepessoappf:tipopess,razaosocialppf:razaosocial,
   current_phaseppf:phase_id[:id],certificacaoppf:pcertificacoes,jparticipoudeoutrachamadadeprojetosdepdestartupsppf:temprojetos)  
   userstartup=UserStartup.last   
   criaalteraprojeto("criar",0,pnomeprojeto,ptitle,userstartup,quantfunatuante,presumoprojeto,pdetalhesprojeto,pdescricao,pcategoriafinal,presolverdorsetor,
                pcontrolegestao,pavaliaimpactoinovacao,pparceriasintercambios,pproblemasambientais,pmetricasquantitativas,
                pquantianecessaria,pdificuldade,ptemconcorrentesb,pquantosconcorrentes,pquaismarcos,pestimativa,pestagiocadeiainovacao,
                tokenid,ppesquisatecnologias,pconcessarias,padotapraticasgestao,paportesquaisinstituicoes,pprodutoservico,
                paportesrecebidos,projetojarecebeualgumaporteppf)
   
 else
   user[0].email=pemail.downcase
   user[0].typeclasse=1
   user[0].save
   puts "vai alterar user"
   puts enquadrament
   puts nomesobrenom
   userstartup=UserStartup.where(user_id:user[0].id)
   userstartup[0].enquadramentoppf=enquadrament    
   userstartup[0].name=nomesobrenom
   userstartup[0].pipefyid=ppipefy_id
   userstartup[0].tipodepessoappf=tipopess
   userstartup[0].razaosocialppf=razaosocial
   userstartup[0].current_phaseppf=phase_id[:id]
   userstartup[0].certificacaoppf=pcertificacoes
   userstartup[0].jparticipoudeoutrachamadadeprojetosdepdestartupsppf=temprojetos
   userstartup[0].nomefantasiappf=pnomefantasia
   userstartup[0].save
   puts "vai alterar userstartup"  
   project=Project.where(user_startup_id:userstartup[0].id)
#=begin
   if project==[]
     criaalteraprojeto("criar",0,pnomeprojeto,ptitle,userstartup[0],quantfunatuante,presumoprojeto,pdetalhesprojeto,pdescricao,pcategoriafinal,presolverdorsetor,
                pcontrolegestao,pavaliaimpactoinovacao,pparceriasintercambios,pproblemasambientais,pmetricasquantitativas,
                pquantianecessaria,pdificuldade,ptemconcorrentesb,pquantosconcorrentes,pquaismarcos,pestimativa,pestagiocadeiainovacao,
                tokenid,ppesquisatecnologias,pconcessarias,padotapraticasgestao,paportesquaisinstituicoes,pprodutoservico,
                paportesrecebidos,projetojarecebeualgumaporteppf)
   else
     puts "VAI ALTERAR PROJETO"
     criaalteraprojeto("alterar",project[0].id,pnomeprojeto,ptitle,userstartup[0],quantfunatuante,presumoprojeto,pdetalhesprojeto,pdescricao,pcategoriafinal,presolverdorsetor,
                pcontrolegestao,pavaliaimpactoinovacao,pparceriasintercambios,pproblemasambientais,pmetricasquantitativas,
                pquantianecessaria,pdificuldade,ptemconcorrentesb,pquantosconcorrentes,pquaismarcos,pestimativa,pestagiocadeiainovacao,
                tokenid,ppesquisatecnologias,pconcessarias,padotapraticasgestao,paportesquaisinstituicoes,pprodutoservico,
                paportesrecebidos,projetojarecebeualgumaporteppf)  
     #criaavaliacoes(project[0].id)           
   end     
#s=end   
   
 end
user=nil
userstartup=nil
#=end
else
#puts "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
#puts tokenid
#puts pemail.downcase
#puts enquadrament
#puts tipopess
#puts "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@" 



end

end 

def criaalteraprojeto(pacao,pidprojeto,pnomeprojeto,ptitle,userstartup,quantfunatuante,presumoprojeto,pdetalhesprojeto,pdescricao,pcategoriafinal,
                      presolverdorsetor,pcontrolegestao,pavaliaimpactoinovacao,pparceriasintercambios,pproblemasambientais,pmetricasquantitativas,
                pquantianecessaria,pdificuldade,ptemconcorrentesb,pquantosconcorrentes,pquaismarcos,pestimativa,pestagiocadeiainovacao,
                tokenid,ppesquisatecnologias,pconcessarias,padotapraticasgestao,paportesquaisinstituicoes,pprodutoservico,
                paportesrecebidos,projetojarecebeualgumaporteppf)
 if pacao=="criar"   
   Project.create(
     name:pnomeprojeto,
     title:ptitle,
     user_startup_id:userstartup.id,
     quantidadedefuncionariosppf:quantfunatuante,
     kindppf:pprodutoservico,
     descricaoppf:pdescricao,
     categoriappf: pcategoriafinal,
     resumoppf:presumoprojeto,
     detalhesppf:pdetalhesprojeto,
     qualdorpretenderesolverppf:presolverdorsetor,
     companypower_ids: getidscompanypower(pconcessarias),
     adotapraticasdegestaoppf: pcontrolegestao,
     processosdeoperacaoegestaoppf: padotapraticasgestao,
     pesquisatecnologiasnaareadesuaatividadeppf: ppesquisatecnologias,
     avaliaoimpactodainovacaoppf:pavaliaimpactoinovacao,
     executaparceriaseintercambiosppf: pparceriasintercambios,
     valiaproblemasambientalppf: pproblemasambientais,
     definemetricasquantitativasparaaferirppf: pmetricasquantitativas,
     ofereceaoscolaboradoresmetodoscontroleegestaoppf: 0,
     qualvalortotaldosaportesrecebidosppf: setvalormenos(paportesrecebidos),
     qualeaquantianecessariapararealizacaoppf: pquantianecessaria,
     qualamaiordificuldadequeoseuprojetoenfrentahojeppf: pdificuldade,
     asuasolucaojatemconcorrentesnomercadoppf: ptemconcorrentesb,
     quantosconcorrentesppf: pquantosconcorrentes,
     quaismarcosjaforamatingidospeloprojetoppf: pquaismarcos,
     qualeaestimativadetempoparaaconclusaoppf: pestimativa,
     estagiocadeiainovacaoppf:pestagiocadeiainovacao,
     tokenidppf:tokenid,
     paportesquaisinstituicoes:paportesquaisinstituicoes,
     projetojarecebeualgumaporteppf:projetojarecebeualgumaporteppf) 
 elsif pacao=="alterar"
    puts pidprojeto
     projeto=Project.where(id:pidprojeto)
     projeto[0].name=pnomeprojeto
     projeto[0].title=ptitle
     projeto[0].user_startup_id=userstartup.id
     projeto[0].quantidadedefuncionariosppf=quantfunatuante
     projeto[0].kindppf= pprodutoservico
     projeto[0].descricaoppf= pdescricao
     projeto[0].categoriappf= pcategoriafinal
     projeto[0].resumoppf=presumoprojeto
     projeto[0].detalhesppf=pdetalhesprojeto
     projeto[0].qualdorpretenderesolverppf= presolverdorsetor
     projeto[0].companypower_ids= getidscompanypower(pconcessarias)
     projeto[0].adotapraticasdegestaoppf= pcontrolegestao
     projeto[0].processosdeoperacaoegestaoppf=padotapraticasgestao 
     projeto[0].pesquisatecnologiasnaareadesuaatividadeppf= ppesquisatecnologias
     projeto[0].avaliaoimpactodainovacaoppf= pavaliaimpactoinovacao
     projeto[0].executaparceriaseintercambiosppf= pparceriasintercambios
     projeto[0].valiaproblemasambientalppf= pproblemasambientais
     projeto[0].definemetricasquantitativasparaaferirppf= pmetricasquantitativas
     projeto[0].ofereceaoscolaboradoresmetodoscontroleegestaoppf= 0
     projeto[0].qualvalortotaldosaportesrecebidosppf= setvalormenos(paportesrecebidos)
     projeto[0].qualeaquantianecessariapararealizacaoppf= pquantianecessaria
     projeto[0].qualamaiordificuldadequeoseuprojetoenfrentahojeppf= pdificuldade
     projeto[0].asuasolucaojatemconcorrentesnomercadoppf= ptemconcorrentesb
     projeto[0].quantosconcorrentesppf= pquantosconcorrentes
     projeto[0].quaismarcosjaforamatingidospeloprojetoppf= pquaismarcos
     projeto[0].qualeaestimativadetempoparaaconclusaoppf= pestimativa
     projeto[0].estagiocadeiainovacaoppf=pestagiocadeiainovacao
     projeto[0].tokenidppf=tokenid
     projeto[0].paportesquaisinstituicoes=paportesquaisinstituicoes
     projeto[0].projetojarecebeualgumaporteppf=projetojarecebeualgumaporteppf
     projeto[0].save      
     
 end
  
end 

def criaavaliacoes()
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
  puts av.count
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
     av[0].save
  end
 end 
end 
end

def emailtipopessenquadrament(arraycadastros,pemail)
retorno=[]    
arraycadastros.each do |arraycadastro|
   if (arraycadastro[0].downcase==pemail.downcase)
     retorno.push(arraycadastro[0])
     retorno.push(arraycadastro[1])
     retorno.push(arraycadastro[2])
     #retorno.push(arraycadastro[3])
     #retorno.push(arraycadastro[4])
     #retorno.push(arraycadastro[5])
     break
   end       
 end
 if retorno==[]
  puts pemail.downcase
  puts 'deu merda'
 end 
 retorno
end







def getidscompanypower(pconcessarias)
pconcs=pconcessarias.tr('[]', '').split(',').map(&:to_str)
retorno=[]
teste=[]
 companypowers=Companypower.all
pconcs.each do |pconc|
 companypowers.each do |companypower|
  if !teste.include?(companypower.name)
     if (companypower.name==pconc.strip)or(companypower.name.in? pconc.strip)
      retorno.push(companypower.id)
      teste.push(companypower.name)
      break
     end
  end 
 end 
end 
 retorno
end




end

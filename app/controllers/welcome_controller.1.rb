class WelcomeController < ApplicationController
  def index
    puts current_user.typeclasse
    if current_user.typeclasse=='User_Normal'
     @user_normal=UserNormal.where(user_id:current_user.id)
     @companypower=Companypower.where(id:@user_normal[0].companypower_id)
     if @user_normal[0].typerole=='admin'
#puts helpers.get_id_pipe('Cadastro')
#puts helpers.get_id_pipe('Test')
#puts helpers.get_inscricoes('WzYxNTY0Njdd')
        #puts helpers.getteste('WzYxNTY0Njdd')
        #helpers.criaavaliacoes()
     end  
    end
  end
  
 
def allpages
 if current_user.typeclasse=='User_Normal'
  if (params[:other]=='projetos')
      puts "##################"
      puts params[:categoria]
      puts "4444444444444444444"
     @user_normal=UserNormal.where(user_id:current_user.id)
     @companypower=Companypower.where(id:@user_normal[0].companypower_id)
     @user_normals=UserNormal.where(companypower_id:@companypower)
        if params[:status]=="0" #Todos
            @q = Project.ransack(params[:q].try(:merge, m: params[:combinator]))
            if params[:categoria]!="0"            
             @projects = @q.result.where('projects.categoriappf = ?', params[:categoria]).paginate(page: params[:page], :per_page => 10).order(name: :asc)
            elsif params[:categoria]=="0"
             @projects = @q.result.all.paginate(page: params[:page], :per_page => 10).order(name: :asc)            
            end
        elsif params[:status]=="1" #Favoritos
            @q = Project.ransack(params[:q].try(:merge, m: params[:combinator]))
            @projects = subquery1(@q,params[:ordem],params[:categoria],@user_normals)
        elsif params[:status]=="2" #Avaliados
            @q = Project.ransack(params[:q].try(:merge, m: params[:combinator]))
            @projects = subquery2(@q,params[:ordem],params[:categoria],@user_normals)
        elsif params[:status]=="3" #Não Avaliados
            @evaluations=Evaluation.where(user_normal_id:@user_normal[0].id, statusbloqueio:0).order(notaavalicacao: :asc)
            arrayprojectid=[]
            @evaluations.each do |eva|
             arrayprojectid.push(eva.project_id)
            end 
            if params[:categoria]!="0"
              projetos=Project.where(:id => arrayprojectid, categoriappf:params[:categoria])
            elsif params[:categoria]=="0" 
              projetos=Project.where(:id => arrayprojectid)
            end  
         @q = projetos.ransack(params[:q].try(:merge, m: params[:combinator]))
         @projects = @q.result.all.paginate(:page => params[:page], :per_page => 10)
        end     
      respond_to do |format|
       format.html { render :_allpages }
      end 
   elsif (params[:other]=='visaogeral')
      @user_normal=UserNormal.where(user_id:current_user.id)
      @evaluations=Evaluation.where(user_normal_id:@user_normal[0].id)
      @companypower=Companypower.where(id:@user_normal[0].companypower_id) 
      respond_to do |format|
       format.html { render :_allpages }
      end
  end
 end     
end

 def subquery1(j,ordem,categoria,user_normals)
  usern=[]
  user_normals.each do|u|
   usern.push(u.id)
  end
  if categoria!="0"
    if ordem=="0"     
      j.result.joins(:evaluations).select('projects.id, projects.name,projects.resumoppf, evaluations.notaavalicacao as evaluation_notaavaliacao')
      .where('user_normal_id IN (?)', usern)
      .where('projects.id > ? AND evaluations.favorito=? AND projects.categoriappf=?',0,true,categoria)
      .paginate(:page => params[:page], :per_page => 10).
      order('evaluation_notaavaliacao ASC')
    elsif ordem=="1"
      j.result.joins(:evaluations).select('projects.id, projects.name,projects.resumoppf, evaluations.notaavalicacao as evaluation_notaavaliacao')
      .where('user_normal_id IN (?)', usern)
      .where('projects.id > ? AND evaluations.favorito=? AND projects.categoriappf=?', 0,true,categoria)
      .paginate(:page => params[:page], :per_page => 10).
      order('evaluation_notaavaliacao DESC')          
    end 
  elsif categoria=="0"
    if ordem=="0"     
      j.result.joins(:evaluations).select('projects.id, projects.name,projects.resumoppf, evaluations.notaavalicacao as evaluation_notaavaliacao')
      .where('user_normal_id IN (?)', usern)
      .where('projects.id > ? AND evaluations.favorito=?', 0,true).paginate(:page => params[:page], :per_page => 10).
      order('evaluation_notaavaliacao ASC')
    elsif ordem=="1"
      j.result.joins(:evaluations).select('projects.id, projects.name,projects.resumoppf, evaluations.notaavalicacao as evaluation_notaavaliacao')
      .where('user_normal_id IN (?)', usern)
      .where('projects.id > ? AND evaluations.favorito=?', 0,true).paginate(:page => params[:page], :per_page => 10).
      order('evaluation_notaavaliacao DESC')          
    end   
  end
     
 end




 def subquery2(j,ordem,categoria,user_normals)
  usern=[]
  user_normals.each do|u|
   usern.push(u.id)
  end  
  if categoria!="0" 
    if ordem=="0"     
      j.result.joins(:evaluations).select('projects.id, projects.name,projects.resumoppf, evaluations.notaavalicacao as evaluation_notaavaliacao')
      .where('user_normal_id IN (?)', usern)
      .where('projects.id > ? AND evaluations.statusbloqueio=? AND projects.categoriappf=?', 0,1,categoria).
      paginate(:page => params[:page], :per_page => 10).
      order('evaluation_notaavaliacao ASC')
    elsif ordem=="1"
      j.result.joins(:evaluations).select('projects.id, projects.name,projects.resumoppf, evaluations.notaavalicacao as evaluation_notaavaliacao')
      .where('user_normal_id IN (?)', usern)
      .where('projects.id > ? AND evaluations.statusbloqueio=? AND projects.categoriappf=?', 0,1,categoria).
      (:page => params[:page], :per_page => 10).
      order('evaluation_notaavaliacao DESC')          
    end 
  elsif categoria=="0" 
      j.result.joins(:evaluations).select('projects.id, projects.name,projects.resumoppf, evaluations.notaavalicacao as evaluation_notaavaliacao')
      .where('user_normal_id IN (?)', usern)
      .where('projects.id > ? AND evaluations.statusbloqueio=?', 0,1).paginate(:page => params[:page], :per_page => 10).
      order('evaluation_notaavaliacao ASC')
    elsif ordem=="1"
      j.result.joins(:evaluations).select('projects.id, projects.name,projects.resumoppf, evaluations.notaavalicacao as evaluation_notaavaliacao')
      .where('user_normal_id IN (?)', usern)
      .where('projects.id > ? AND evaluations.statusbloqueio=?', 0,1).paginate(:page => params[:page], :per_page => 10).
      order('evaluation_notaavaliacao DESC')   
  end
 end
=begin 
 def subquery3(j,ordem)
  if ordem=="0"     
    j.result.joins(:evaluations).select('projects.id, projects.name,projects.resumoppf, evaluations.notaavalicacao as evaluation_notaavaliacao')
    .where('projects.id > ? AND evaluations.statusbloqueio=?', 0,0).paginate(:page => params[:page], :per_page => 10).
    order('projects.name ASC')
  elsif ordem=="1"
    j.result.joins(:evaluations,:user_normal).select('projects.id, projects.name,projects.resumoppf, evaluations.notaavalicacao as evaluation_notaavaliacao')
    .where('projects.id > ? AND evaluations.statusbloqueio=?', 0,0).paginate(:page => params[:page], :per_page => 10).
    order('projects.name DESC')          
  end 
 end
=end  
  def sobre
    if current_user.typeclasse=='User_Normal'
     @user_normal=UserNormal.where(user_id:current_user.id)
     @companypower=Companypower.where(id:@user_normal[0].companypower_id)    
      respond_to do |format|
       format.html { render :_sobre }
     end 
    end 
  end   
 
 
  
end

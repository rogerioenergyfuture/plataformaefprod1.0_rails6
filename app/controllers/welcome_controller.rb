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
     @user_normal=UserNormal.where(user_id:current_user.id)
     @companypower=Companypower.where(id:@user_normal[0].companypower_id)
     @user_normals=UserNormal.where(companypower_id:@companypower)
        if params[:status]=="0" #Todos
            @q = Project.ransack(params[:q].try(:merge, m: params[:combinator]))
            if (params[:categoria]!="0")and(params[:ordem]=="0")            
             @projects = @q.result.where('projects.categoriappf = ?', params[:categoria]).paginate(page: params[:page], :per_page => 10).order(name: :desc)
            elsif (params[:categoria]=="0")and(params[:ordem]=="0") 
             @projects = @q.result.all.paginate(page: params[:page], :per_page => 10).order(name: :desc) 
            elsif (params[:categoria]!="0")and(params[:ordem]=="1")            
             @projects = @q.result.where('projects.categoriappf = ?', params[:categoria]).paginate(page: params[:page], :per_page => 10).order(name: :asc)
            elsif (params[:categoria]=="0")and(params[:ordem]=="1") 
             @projects = @q.result.all.paginate(page: params[:page], :per_page => 10).order(name: :asc)   
            end
        elsif params[:status]=="1" #Favoritos
            @q = Project.ransack(params[:q].try(:merge, m: params[:combinator]))
            @projects = subquery1(@q,params[:ordem],params[:categoria],@user_normals)
            puts @projects.count
        elsif params[:status]=="2" #Avaliados
            @q = Project.ransack(params[:q].try(:merge, m: params[:combinator]))
            @projects = subquery2(@q,params[:ordem],params[:categoria],@user_normals)
        elsif params[:status]=="3" #Não Avaliados
          if (@user_normal[0].typerole=="avaliador")or(@user_normal[0].typerole=="visualizador")
           @q = Project.ransack(params[:q].try(:merge, m: params[:combinator]))
           @projects = subquery4(@q,params[:ordem],params[:categoria],@user_normals)  
           arrayprojectid=[]
           arraybloqueado=[]
           @projects.each do |m|
            if (m.statusbloqueio==0)
               arrayprojectid.push(m.project_id)
            elsif (m.statusbloqueio==1)
             arraybloqueado.push(m.project_id)
            end 
           end
           arrayprojectid=arrayprojectid-arraybloqueado
           arrayprojectid=arrayprojectid.uniq
          end 
            if params[:categoria]!="0"
              projetos=Project.where(:id => arrayprojectid, categoriappf:params[:categoria])
            elsif params[:categoria]=="0" 
              projetos=Project.where(:id => arrayprojectid)
            end  
         @q = projetos.ransack(params[:q].try(:merge, m: params[:combinator]))
         if params[:ordem]=="0"
         @projects = @q.result.all.paginate(:page => params[:page], :per_page => 10).order(name: :desc)
         elsif params[:ordem]=="1"
         @projects = @q.result.all.paginate(:page => params[:page], :per_page => 10).order(name: :asc)
         end
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
  puts categoria
  puts "subquery1"
  puts ordem
  puts j.result.count
  if categoria!="0"
    if ordem=="0"     
      j.result.joins(:evaluations).select('projects.id, projects.name,projects.resumoppf, evaluations.notaavalicacao as evaluation_notaavaliacao')
      .where('user_normal_id IN (?)', usern)
      .where('projects.id > ? AND evaluations.favorito=? AND projects.categoriappf=?',0,true,categoria)
      .paginate(:page => params[:page], :per_page => 10).
      order('evaluation_notaavaliacao DESC')
    elsif ordem=="1"
      j.result.joins(:evaluations).select('projects.id, projects.name,projects.resumoppf, evaluations.notaavalicacao as evaluation_notaavaliacao')
      .where('user_normal_id IN (?)', usern)
      .where('projects.id > ? AND evaluations.favorito=? AND projects.categoriappf=?', 0,true,categoria)
      .paginate(:page => params[:page], :per_page => 10).
      order('evaluation_notaavaliacao ASC')          
    end 
  elsif categoria=="0"
    if ordem=="0"     
      j.result.joins(:evaluations).select('projects.id, projects.name,projects.resumoppf, evaluations.notaavalicacao as evaluation_notaavaliacao')
      .where('user_normal_id IN (?)', usern)
      .where('projects.id > ? AND evaluations.favorito=?', 0,true).paginate(:page => params[:page], :per_page => 10).
      order('evaluation_notaavaliacao DESC')
    elsif ordem=="1"
      j.result.joins(:evaluations).select('projects.id, projects.name,projects.resumoppf, evaluations.notaavalicacao as evaluation_notaavaliacao')
      .where('user_normal_id IN (?)', usern)
      .where('projects.id > ? AND evaluations.favorito=?', 0,true).paginate(:page => params[:page], :per_page => 10).
      order('evaluation_notaavaliacao ASC')          
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
      puts "entrei em ordem 0 categoria dif 0"    
      j.result.joins(:evaluations).select('projects.id, projects.name,projects.resumoppf, evaluations.notaavalicacao as evaluation_notaavaliacao')
      .where('user_normal_id IN (?)', usern)
      .where('projects.id > ? AND evaluations.statusbloqueio=? AND projects.categoriappf=?', 0,1,categoria).
      paginate(:page => params[:page], :per_page => 10).
      order('evaluation_notaavaliacao DESC')
    elsif ordem=="1"
      puts "entrei em ordem 1 categoria dif 0" 
      j.result.joins(:evaluations).select('projects.id, projects.name,projects.resumoppf, evaluations.notaavalicacao as evaluation_notaavaliacao')
      .where('user_normal_id IN (?)', usern)
      .where('projects.id > ? AND evaluations.statusbloqueio=? AND projects.categoriappf=?', 0,1,categoria).
      paginate(:page => params[:page], :per_page => 10).
      order('evaluation_notaavaliacao ASC')        
    end 
  elsif categoria=="0" 
    if ordem=="0"
      puts "entrei em ordem 0 categoria igual 0" 
      j.result.joins(:evaluations).select('projects.id, projects.name,projects.resumoppf, evaluations.notaavalicacao as evaluation_notaavaliacao')
      .where('user_normal_id IN (?)', usern)
      .where('projects.id > ? AND evaluations.statusbloqueio=?', 0,1).paginate(:page => params[:page], :per_page => 10).
      order('evaluation_notaavaliacao DESC')
    elsif ordem=="1"
      puts "entrei em ordem 1 categoria igual 0"
      j.result.joins(:evaluations).select('projects.id, projects.name,projects.resumoppf, evaluations.notaavalicacao as evaluation_notaavaliacao')
      .where('user_normal_id IN (?)', usern)
      .where('projects.id > ? AND evaluations.statusbloqueio=?', 0,1).paginate(:page => params[:page], :per_page => 10).
      order('evaluation_notaavaliacao ASC') 
    end  
  end
 end
 
 def subquery4(j,ordem,categoria,user_normals)
  usern=[]
  user_normals.each do|u|
   if u.typerole=='avaliador'
    usern.push(u.id)
   end    
  end
  puts "entrei subquery4" 
  #puts j.result.count
  if categoria!="0" 
    if ordem=="0" 
      puts "entrei em ordem 0 categoria dif 0"    
      Project.joins(:evaluations).select('*').where('projects.id > ? AND user_normal_id IN (?) AND projects.categoriappf=?', 0,usern,categoria)
    elsif ordem=="1"
      puts "entrei em ordem 1 categoria dif 0" 
      Project.joins(:evaluations).select('*').where('projects.id > ? AND user_normal_id IN (?) AND projects.categoriappf=?', 0,usern,categoria)
    end 
  elsif categoria=="0" 
    if ordem=="0"
      puts "entrei em ordem 0 categoria igual 0" 
    Project.joins(:evaluations).select('*').where('projects.id > ? AND user_normal_id IN (?)', 0,usern)
    elsif ordem=="1"
      puts "entrei em ordem 1 categoria igual 0"
    Project.joins(:evaluations).select('*').where('projects.id > ? AND user_normal_id IN (?)', 0,usern)
    end  
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
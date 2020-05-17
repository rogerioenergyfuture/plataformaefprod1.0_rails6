# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/
   #def new
     #super
   #end

def create
  teste=params[:user]
  retorno=validasenha(teste[:email],teste[:password])
  if (teste[:liberar]=='1')and(retorno=='ok')
   super
  else
    respond_to do |format|
      #format.js #views/users/create.js.erb
      if teste[:liberar]=='0'
       format.js { render "create" }
      elsif retorno!='ok'
       format.js { render "create1" }  
      end 
    end  
  end
end 
def validasenha(pemail,senha)
 if (pemail!='')and(senha!='') 
  teste=User.where(email:pemail)
  if teste!=[]
    if valid_password1?(senha,pemail)
      'ok'
    else
      "email/senha inválido" 
    end  
  else
    "email/senha inválido"
  end  
 else
   "email/senha inválido" 
 end   
end 

  def valid_password1?(password,pemail)
    @user=User.where(email:pemail)
    @user[0].valid_password?(password)
  end

 
  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end
=begin  
def validasenha(pemail,senha)
  teste=User.where(email:pemail)
  if teste!=nil
    if senha!=""    
      if teste[0].password==senha
        "ok"
      else
        "pass errada"  
      end
    else 
      "pass vazio"  
    end         
  else 
    "email inválido"  
  end    
end      
=end
  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end

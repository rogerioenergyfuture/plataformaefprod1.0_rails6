module ApplicationHelper
    
#def mobile_device
  #agent = request.user_agent
  #if  request.user_agent.downcase.match(/mac OS|windows/)
   #return "desktop"
  #end
  #return "tablet" if agent =~ /(tablet|ipad)|(android(?!.*mobile))/i
  #return "mobile" if agent =~ /Mobile/
  #
#end

def mobile_device
  agent = request.user_agent
  return "tablet" if agent =~ /(tablet|ipad)|(android(?!.*mobile))/i
  return "mobile" if agent =~ /Mobile/
  return "desktop"
end

  def getdatimeformatado(datat)
   if datat!=nil
    datat.strftime("%d-%m-%Y %H:%M:%S")
   end 
  end
    
end

module CompanypowersHelper
    
def getnamecompanypower(arrayids)
arraycp=""   
 if arrayids!=[]
   arrayids.each do |id|
    cp=Companypower.find(id)
    arraycp=arraycp+cp.name+" "   
   end       
 end 
 arraycp
end 





end

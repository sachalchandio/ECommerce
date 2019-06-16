module ApplicationHelper
    
    def someAction
      return @departments = Department.all
    end
    
   def getBrands
     return @brands = Brand.all
   end
   
   def currentUser
       @currentUser = helpers.get_user
   end

    
end

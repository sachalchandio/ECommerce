class AdministratorController < ApplicationController
 before_action :is_admin_, :only => [:home]
    
    def home
        
           
    end
    
    
end

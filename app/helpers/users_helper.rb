module UsersHelper
    include SessionsHelper
    private
    
    def get_user 
        if logged_in?
            if(user_id = session[:user_id])
                user = User.find_by_id(user_id)
            elsif(user_id = cookies.signed[:user_id])
                user = User.find_by_id(user_id)
        return user
            end 
        end
    end
    
    
        
end

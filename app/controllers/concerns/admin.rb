module Admin
    include SessionsHelper
    
    private
        def is_admin_
            if logged_in?
                if(user_id = session[:user_id])
                    user = User.find_by_id(user_id)
                elsif(user_id = cookies.signed[:user_id])
                    user = User.find_by_id(user_id)
                end
                if user.is_admin == "1"
                    return true
                    
                else
                    flash[:notice] = "You don't have access to this page"
                    redirect_to root_path
                    return false
                end
            else
                flash[:notice] = "You don't have access to this page"
                redirect_to root_path
                return false
            end
        end
    end
    
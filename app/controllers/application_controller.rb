require 'concerns/current_cart'

class ApplicationController < ActionController::Base
 
  
  include DepartmentsHelper 
  protect_from_forgery with: :exception
  include SessionsHelper
  include SubDepartmentsHelper
  include Admin
  include UsersHelper
  
  
  #filter_parameter_logging :card_number, :card_verification
  
  
 
  
end


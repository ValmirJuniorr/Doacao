class ApplicationController < ActionController::Base
  include Pundit

  before_action :configure_permitted_parameters, if: :devise_controller?
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  
  private
  	def user_not_authorized
  		flash[:notice] = "Voçê não tem permissão !"
  		redirect_to(request.referrer || root_path)
  	end
  
  def savenew
  sql = "insert into users (name,email, created_at,updated_at) values( 
        #{ActiveRecord::Base.connection.quote(user_params[:name])}, 
        #{ActiveRecord::Base.connection.quote(user_params[:email])},now(), now())"
  ActiveRecord::Base.connection.execute(sql)
  redirect_to action: 'index'
end

  protected

  def configure_permitted_parameters
    added_attrs = [:username, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
end


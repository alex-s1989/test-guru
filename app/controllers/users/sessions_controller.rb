class Users::SessionsController < Devise::SessionsController
 
  def create
    self.resource = warden.authenticate!(auth_options)
    # set_flash_message!(:notice, :signed_in)
    # set_flash_message!(:notice, "Привет, #{current_user.name}!")
    sign_in(resource_name, resource)
    yield resource if block_given?
    path = current_user.admin? ? admin_root_path : root_path
    redirect_to path, notice: "Привет, #{current_user.name}!"
    
    # respond_with resource, location: after_sign_in_path_for(resource)
    
  end
end

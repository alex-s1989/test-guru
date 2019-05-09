class Users::SessionsController < Devise::SessionsController
 
  def create
    self.resource = warden.authenticate!(auth_options)
    # set_flash_message!(:notice, :signed_in)
    # set_flash_message!(:notice, "Привет, #{current_user.name}!")
    sign_in(resource_name, resource)
    yield resource if block_given?
    if current_user.is_a?(Admin)
      redirect_to admin_tests_path, notice: "Привет, #{current_user.name}!"
    else redirect_to root_path, notice: "Привет, #{current_user.name}!"
    end
    # respond_with resource, location: after_sign_in_path_for(resource)
    
  end
end

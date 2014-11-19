class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :login_person

  # This method return the login person.
  def login_person
    current_customer || current_vendor
  end

  private

    # This method set the after sign in path based on the login user/admin.
    def after_sign_in_path_for(resource)
      eval("#{resource.class.table_name}_dashboard_path")
    end
end

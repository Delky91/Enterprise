# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  # Solo los admin pueden crear cuentas
  before_action :authenticate_user!, :redirect_unless_admin, only: %i[create new]
  # Linea para para evitar el user already log in
  skip_before_action :require_no_authentication

  private

  def redirect_unless_admin
    return if current_user && current_user.role == 'admin'

    flash[:error] = 'Only admins can do that'
    redirect_to root_path
  end

  # Metodo para evitar el logueo automatico de cuentas nuevas
  def sign_up(_resource_name, _resource)
    true
  end

  protected

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: %i[name email password password_confirmation role profile_picture])
  end
end

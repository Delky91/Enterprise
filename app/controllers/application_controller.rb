class ApplicationController < ActionController::Base
  # Redirijo al usuario a jobs_path una vez haya logrado hacer log in
  def after_sign_in_path_for(_resource)
    jobs_path
  end
end

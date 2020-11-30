class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  def after_sign_in_path_for(resource)
    dashboard_index_path
  end

  protected

  def require_login
    unless current_user
      redirect_to root_path, notice: "Pour accéder à cette page vous devez être connecté"
    end
  end

  def check
    if current_user.activated == false
      redirect_to root_path, alert: "votre compte a été suspendu, contactez notre service pour avoir plus de détail"
    end
  end
end

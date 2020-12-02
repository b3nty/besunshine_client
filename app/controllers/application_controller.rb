class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  def after_sign_in_path_for(resource)
    dashboard_index_path
  end

  protected

  def require_login
    unless current_user
      flash[:notice] = "Pour accéder à cette page vous devez être connecté"
      redirect_to root_path
    end
  end

  def check
    if current_user.activated == false
      flash[:alert] = "votre compte a été suspendu, contactez notre service pour avoir plus de détail"
      redirect_to root_path
    end
  end
end

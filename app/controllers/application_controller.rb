class ApplicationController < ActionController::Base

  helper_method :current_user, :logged_in, :require_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    #atribui o id à variavel se ela estiver nula
  end

  def logged_in
    nil ||current_user #Retorna true se existe
  end

  def require_user
    if !logged_in
      flash[:danger] = "You need to log in first!"
      redirect_to root_path
    end
  end
end

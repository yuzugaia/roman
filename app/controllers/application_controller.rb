class ApplicationController < ActionController::Base
  
  before_action :authenticate_user!, except: [:top, :about]
  before_action :ensure_guest_user, only: [:edit]
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  
  def configure_permitted_parameters

    devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])

  end


  def after_sign_in_path_for(resource)
    novel_index_path(current_user.id)
  end

  def after_sign_out_path_for(resource)
    root_path
  end
  
  def ensure_guest_user
    @user = User.find(params[:id])
    if @user.email == "guest@example.com"
      redirect_to user_path(current_user) , notice: "ゲストユーザーはプロフィール編集画面へ遷移できません。"
    end
  end  
  
end

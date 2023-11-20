class ApplicationController < ActionController::Base
  
  before_action :authenticate_user!, except: [:top, :about]
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  #ログイン後の画面遷移先
  def after_sign_in_path_for(resource_or_scope)
    if resource_or_scope.is_a?(Admin)
      admin_root_path                   #管理者
    else
      user_path(current_user.id)        #ユーザー
    end
  end

  #ログアウト後の画面遷移先
  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :admin
      new_admin_session_path            #管理者
    else
      root_path                         #ユーザー
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email,:name])
  end
  
  def ensure_guest_user
    @user = User.find(params[:id])
    if @user.email == "guest@example.com"
      redirect_to user_path(current_user) , notice: "ゲストユーザーはプロフィール編集画面へ遷移できません。"
    end
  end  
  
end

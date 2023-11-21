# frozen_string_literal: true

class User::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  #ログイン後の画面遷移先
  def after_sign_in_path_for(resource)
    user_path(current_user.id)
  end

  #ログアウト後の画面遷移先
  def after_sign_out_path_for(resource)
    root_path
  end


  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  def guest_sign_in
    user = User.guest
    sign_in user
    redirect_to user_path(user), notice: "ゲストとしてログインしました。"
  end

  protected

  def reject_user
    @user = User.find_by(email: params[:user][:email])
    if @user
      if @user.valid_password?(params[:user][:password]) && (@user.is_active == false)
        flash[:notice] = "退会済みです"
        redirect_to new_user_session_path
      end
    else
      flash[:error] = "必須項目を入力してください"
    end
  end
end

class ApplicationController < ActionController::Base
  # 全てのコントローラで、最初にbefore_actionメソッドが実行（devise使用時）
  before_action :authenticate_user!, except: [:top]
  # ↑認証済ユーザー以外はtopへ
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    post_images_path
  end

  def after_sign_out_path_for(resouece)
    about_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end

class ApplicationController < ActionController::Base
  before_filter :require_login  # ベースクラスでこの指定を行うことで全メソッド、ログイン後にしか実行できない
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  # 未ログイン時の処理
  def not_authenticated
    redirect_to login_path, alert: "Please login first"
  end
end

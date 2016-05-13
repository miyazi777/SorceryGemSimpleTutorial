class UserSessionsController < ApplicationController
  skip_before_filter :require_login, except: [:destroy] # ユーザー削除時はログインチェックを行わない

  # ログイン画面表示
  def new
    @user = User.new
  end

  # ログイン処理
  def create
    if @user = login(params[:email], params[:password]) # sorceryのlogin処理を行う
      redirect_back_or_to(:users, notice: 'Login successful') # ログインに成功したらユーザー一覧へ
    else
      flash.now[:alert] = 'Login failed'
      render action: 'new'
    end
  end

  # ログアウト処理
  def destroy
    logout  # sorceryのlogout処理を行う
    redirect_to(:users, notice: 'Logged out!')
  end
end

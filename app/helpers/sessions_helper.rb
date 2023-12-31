module SessionsHelper
#渡されたユーザーでログイン
  def log_in(user)
    session[:user_id] = user.id
  end

#現在ログイン中のユーザーを返す
  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end

#受け取ったユーザーがログイン中のユーザーと一致すればtrue
  def current_user?(user)
    user == current_user
  end

#ユーザーがログインしていればture、そうでなければfalse
  def logged_in?
    !current_user.nil?
  end

#現在位のユーザーをログアウトする
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
end

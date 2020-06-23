module AuthorizationHelper
  def sign_up(user)
    # Authのリンクが変わる場合は修正が必要
    post '/api/auth',
         # factorybotのpasswordからデータをとるとエラーが出るので手入力で対応
         params: {
             name: user[:name],
             email: user[:email],
             password: '11111111',
             password_confirmation: '11111111' },
         as: :json
    puts response.status
  end

  def auth_tokens_for_user(user)
    # Authのリンクが変わる場合は修正が必要
    post '/api/auth/sign_in/',
         params: { email: user['email'], password: '11111111' },
         as: :json
    response.headers.slice('client', 'access-token', 'uid')
  end
end

module AuthorizationHelper
  def sign_up(user)

    # The argument 'user' should be a hash that includes the params 'email' and 'password'.
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
    puts 'user data--------'
    puts user
    puts 'user data--------'
    # The argument 'user' should be a hash that includes the params 'email' and 'password'.
    post '/api/auth/sign_in/',
         params: { email: user['email'], password: '11111111' },
         as: :json
    # The three categories below are the ones you need as authentication headers.
    response.headers.slice('client', 'access-token', 'uid')
  end
end

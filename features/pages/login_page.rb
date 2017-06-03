class LoginPage < Page
  text_field :email, id: 'email'
  text_field :password, id: 'passwd'
  button :submit, id: 'SubmitLogin'

  def sign_in(user)
    self.email = user[:email]
    self.password = user[:password]
    submit
    CartPage.new(@browser)
  end
end

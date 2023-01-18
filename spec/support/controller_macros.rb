module ControllerMacros

  def login_user
    @controller = ApplicationController.new
    @controller.request = ActionDispatch::TestRequest.create
    @controller.request.env['devise.mapping'] = Devise.mappings[:user]
    @user = User.create(
      name: 'John Doe',
      email: 'johndoe@gmail.com',
      password: '123456'
    )
    sign_in @user
  end
end






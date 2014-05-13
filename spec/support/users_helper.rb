module UsersHelper
  
  def sign_in_as(user)
    visit '/login'

    fill_in 'email', :with => user.email
    fill_in 'password', :with => 'testpass'

    click_button "Login"
  end

end

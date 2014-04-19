require 'spec_helper'

feature 'Users' do

  let(:user) { FactoryGirl.create(:user) }

  scenario 'As a curious author I want to be able to sign pu' do
    visit signup_path

    fill_in 'user_email', :with => "test@example.com"
    fill_in 'user_name', :with => "test"
    fill_in 'user_password', :with => "testpass"
    fill_in 'user_password_confirmation', :with => "testpass"
    click_button "Create User"
    
    expect(page.body).to have_content "Thank you for signing up"
  end

  scenario 'As a curious author I want to see errors when the signup form fails' do
    visit signup_path

    fill_in 'user_email', :with => "test@example.com"
    fill_in 'user_name', :with => "test"
    click_button "Create User"

    expect(page.body).to have_content "Password can't be blank"
  end

  scenario 'As an Author I want to be able to log in' do
    visit login_path

    fill_in 'email', :with => user.email
    fill_in 'password', :with => user.password
    click_button 'Login'

    expect(page.body).to have_content "Logged in"
  end

  scenario 'As an Author I want to get a message when my login fails' do
    visit login_path

    fill_in 'email', :with => user.email
    fill_in 'password', :with => 'cats'
    click_button 'Login'

    expect(page.body).to have_content "Email or password is invalid"

  end
end

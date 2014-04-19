require 'spec_helper'

feature 'Users' do

  scenario 'As a curious author I want to be able to sign pu' do
    visit new_user_path

    fill_in 'user_email', :with => "test@example.com"
    fill_in 'user_name', :with => "test"
    fill_in 'user_password', :with => "testpass"
    fill_in 'user_password_confirmation', :with => "testpass"
    click_button "Create User"
    
    expect(page.body).to have_content "Thank you for signing up"
  end

  scenario 'As a curious author I want to see errors when the signup form fails' do
    visit new_user_path

    fill_in 'user_email', :with => "test@example.com"
    fill_in 'user_name', :with => "test"
    click_button "Create User"

    expect(page.body).to have_content "Password can't be blank"
  end

  scenario 'As an Author I want to be able to log in' do
    skip
  end
end

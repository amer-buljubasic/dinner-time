require 'spec_helper'

def login_user(user)
  @request.env['devise.mapping'] = Devise.mappings[:user]

  sign_in user
end

def login(user)
  visit 'users/sign_in'

  within('#new_user') do
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
  end

  click_on 'Log in'
end

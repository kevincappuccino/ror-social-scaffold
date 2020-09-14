require 'rails_helper'

RSpec.describe 'login page', type: :feature do
  let(:user) do
    User.create(name: 'tester', email: 'tester@gmail.com',
                password: 'tester123', password_confirmation: 'test123')
  end
  scenario 'invalid login' do
    visit 'users/sign_in'
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'Log in'
    expect(page).to have_content('Invalid Email or password')
  end
end

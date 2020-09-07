require 'rails_helper'

RSpec.describe 'login page', type: :feature do
  let(:user) do
    User.create(name: 'tester', email: 'tester@gmail.com',
                password: 'tester123', password_confirmation: 'test123')
  end
  scenario 'login' do
    visit 'users/sign_up'
    # fill_in 'user_email', with: user.email
    # fill_in 'user_password', with: user.password
    # click_button 'Log in'
    expect(page).to have_content('Log in')
  end
end
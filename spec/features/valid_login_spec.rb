require 'rails_helper'
# Integration test with Capybara
RSpec.describe 'login page', type: :feature do
  let(:user) do
    User.create(name: 'kevin', email: 'kevin@gmail.com',
                password: '123456', password_confirmation: '123456')
  end
  scenario 'valid login' do
    visit 'users/sign_in'
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'Log in'
    expect(page).to have_content('Signed in successfully.')
  end
end

require 'spec_helper'

RSpec.describe 'login page', type: :feature do
  let(:user) do
    User.create(name: 'tester', email: 'tester@gmail.com',
                password: '123456', password_confirmation: '123456')
  end
  scenario 'login' do
    visit 'users/signup'
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'Log in'
    expect(page).to have_content('Signed in successfully')
  end
end
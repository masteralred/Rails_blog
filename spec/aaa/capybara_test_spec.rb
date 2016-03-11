require 'rails_helper'

feature "Signing in" do
  background do
    User.create(:email => 'user@examp.com', :password => '12345678', :username => 'vasya')
  end

  scenario "Signing in with correct credentials" do
    visit new_user_session_path
    fill_in :user_email, :with => 'user@examp.com'
    fill_in :user_password, :with => '12345678'
    click_button 'Log in'
    expect(page).to have_content I18n.t('devise.sessions.signed_in')
  end

  given(:other_user) { User.create(:email => 'other@example.com', :password => '12345678', :username => 'petya') }

  scenario "Signing in as another user" do
    visit new_user_session_path
    fill_in :user_email, :with => other_user.email
    fill_in :user_password, :with => other_user.password
    click_button 'Log in'
    expect(page).to have_content I18n.t('devise.sessions.signed_in')
  end

  scenario "Signing in as unregistered user" do
    visit new_user_session_path
    fill_in :user_email, :with => 'fraud@mail.com'
    fill_in :user_password, :with => 'fraudfraud'
    click_button 'Log in'
    expect(page).to have_content I18n.t('devise.failure.invalid', authentication_keys: 'email')
  end
end
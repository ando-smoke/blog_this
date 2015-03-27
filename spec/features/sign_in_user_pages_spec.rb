require 'rails_helper'

describe 'the sign in a user process' do
  it 'takes you to the sign in page' do
    visit root_path
    click_on 'Sign In'
    expect(page).to have_content 'Sign in'
  end

  it 'signs in a preexisting user' do
    FactoryGirl.create(:user)
    visit new_user_session_path
    fill_in 'Email', with: 'andy@amail.com'
    fill_in 'Password', with: '12345678'
    click_on 'Sign in'
    expect(page).to have_content 'Signed in successfully.'
  end

  it 'acknowledges when the user is already signed in' do
    FactoryGirl.create(:user)
    visit new_user_session_path
    fill_in 'Email', with: 'andy@amail.com'
    fill_in 'Password', with: '12345678'
    click_on 'Sign in'
    click_on 'Sign In'
    expect(page).to have_content 'already signed in.'
  end

  it 'gives an error when no email address is entered' do
    visit new_user_session_path
    click_on 'Sign in'
    expect(page).to have_content 'Invalid email or password.'
  end

  it 'allows a user to retrieve their forgotten password' do
    FactoryGirl.create(:user)
    visit new_user_session_path
    click_on 'Forgot your password?'
    fill_in 'Email', with: 'andy@amail.com'
    click_on 'Send me reset password instructions'
    expect(page).to have_content 'You will receive an email'
  end

  it 'gives an error on password reset page when no email is entered' do
    visit new_user_session_path
    click_on 'Forgot your password?'
    click_on 'Send me reset password instructions'
    expect(page).to have_content 'error'
  end

  it 'gives an error on password reset page when user email is not in system' do
    visit new_user_session_path
    click_on 'Forgot your password?'
    fill_in 'Email', with: 'abc@def.com'
    click_on 'Send me reset password instructions'
    expect(page).to have_content 'Email not found'
  end
end

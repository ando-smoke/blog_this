require 'rails_helper'

describe 'the sign out a user process' do
  it 'signs out the current user' do
    FactoryGirl.create(:user)
    visit new_user_session_path
    fill_in 'Email', with: 'andy@amail.com'
    fill_in 'Password', with: '12345678'
    click_on 'Sign in'
    click_on 'Sign Out'
    expect(page).to have_content 'Signed out successfully.'
  end
end

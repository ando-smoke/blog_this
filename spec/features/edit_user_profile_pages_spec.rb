require 'rails_helper'

describe 'the edit a user profile process' do
  it 'takes you to the edit profile page' do
    user = FactoryGirl.create(:user)
    sign_in(user)
    click_on 'Edit Profile'
    expect(page).to have_content 'Edit User'
  end

  it 'edits the email address of the current user' do
    user = FactoryGirl.create(:user)
    sign_in(user)
    click_on 'Edit Profile'
    fill_in 'Email', with: 'bob@amail.com'
    fill_in 'Current password', with: '12345678'
    click_on 'Update'
    expect(page).to have_content 'Signed in as bob@amail.com'
  end

  it 'gives an error when no current password is entered' do
    user = FactoryGirl.create(:user)
    sign_in(user)
    click_on 'Edit Profile'
    fill_in 'Email', with: 'bob@amail.com'
    click_on 'Update'
    expect(page).to have_content 'error'
  end
end

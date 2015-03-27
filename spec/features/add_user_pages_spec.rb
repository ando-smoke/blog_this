require 'rails_helper'

describe 'the add a new user process' do
  it 'takes you to the sign up page' do
    visit root_path
    click_on 'Sign Up'
    expect(page).to have_content 'Sign up'
  end

  it 'adds a new user' do
    visit new_user_registration_path
    fill_in 'Email', with: 'andy@amail.com'
    fill_in 'Password', with: '23456789'
    fill_in 'Password confirmation', with: '23456789'
    click_on 'Sign up'
    expect(page).to have_content 'signed up successfully.'
  end

  it 'gives an error when no comment body is entered' do
    visit new_user_registration_path
    click_on 'Sign up'
    expect(page).to have_content 'errors' 
  end
end

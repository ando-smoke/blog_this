require 'rails_helper'

describe 'the sign in as a guest user process' do
  it 'signs in as a guest user' do
    visit root_path
    click_on 'Enter As Guest'
    expect(page).to have_content 'Guest'
  end
end

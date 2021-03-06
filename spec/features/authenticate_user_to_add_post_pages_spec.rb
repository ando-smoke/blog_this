require 'rails_helper'

describe 'the before_authenticate requirement for adding a post ' \
  'process' do
  it 'will not allow a non-signed in user to add a post' do
    visit posts_path
    click_on 'Add New Post'
    expect(page).to have_content 'You need to sign in'
  end
end

require 'rails_helper'

describe 'the before_authenticate requirement for adding a comment ' \
  'process' do
  it 'will not allow a non-signed in user to add a comment' do
    comment = FactoryGirl.create(:comment)
    visit post_path(comment.post)
    click_on 'Add New Comment'
    expect(page).to have_content 'You need to sign in'
  end
end

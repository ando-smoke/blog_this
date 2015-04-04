require 'rails_helper'

describe 'the delete a comment process' do
  it 'deletes a preexisting comment', vcr: true do
    comment = FactoryGirl.create(:comment)
    sign_in(comment.user)
    visit post_path(comment.post)
    click_on 'Delete'
    expect(page).to have_content 'deleted!'
  end
end

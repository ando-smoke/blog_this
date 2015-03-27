require 'rails_helper'

describe 'the delete a comment process' do
  it 'edits the body of a preexisting comment' do
    comment = FactoryGirl.create(:comment)
    visit post_path(comment.post)
    click_on 'Delete'
    expect(page).to have_content 'deleted!'
  end
end

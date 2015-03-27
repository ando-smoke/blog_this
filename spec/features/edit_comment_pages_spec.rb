require 'rails_helper'

describe 'the edit a comment process' do
  it 'edits the body of a preexisting comment' do
    comment = FactoryGirl.create(:comment)
    visit post_path(comment.post)
    click_on 'Edit'
    fill_in 'Body', with: 'You know it man!'
    click_on 'Update Comment'
    expect(page).to have_content 'updated!'
  end
end

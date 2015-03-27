require 'rails_helper'

describe 'the edit a post process' do
  it 'edits the title of a preexisting post' do
    visit post_path(FactoryGirl.create(:post))
    click_on 'Delete Post'
    expect(page).to have_content 'deleted!'
  end
end

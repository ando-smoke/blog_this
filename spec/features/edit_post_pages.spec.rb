require 'rails_helper'

describe 'the edit a post process' do
  it 'edits the title of a preexisting post' do
    visit post_path(FactoryGirl.create(:post))
    click_on 'Edit Post'
    fill_in 'Title', with: 'Can you believe it?'
    click_on 'Update Post'
    expect(page).to have_content 'believe'
  end
end

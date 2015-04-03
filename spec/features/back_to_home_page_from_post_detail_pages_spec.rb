require 'rails_helper'

describe 'the back to home page (from post detail page) process' do
  it 'returns back to the home page from a post detail page' do
    visit post_path(FactoryGirl.create(:post))
    click_on 'All Posts'
    expect(page).to have_content 'Posts:'
  end
end

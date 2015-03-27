require 'rails_helper'

describe 'the show post detail process' do
  it 'shows the detail for a single post when clicked on ' \
    'from home page' do
    post = Post.create(
      title: 'Two weeks to go!',
      body: 'Almost there!'
    )
    visit posts_path
    click_on 'Two weeks to go!'
    expect(page).to have_content 'weeks'
  end
end

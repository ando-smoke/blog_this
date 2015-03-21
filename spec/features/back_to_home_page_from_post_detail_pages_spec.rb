require 'rails_helper'

describe 'the back to home page (from post detail page) process' do
  it 'returns back to the home page from a post detail page' do
    post = Post.create(
      title: 'Last nites Sonic Youth show',
      body: 'Thurston is the man!'
    )
    visit post_path(post)
    click_on 'Back to Home Page'
    expect(page).to have_content 'Posts:'
  end
end

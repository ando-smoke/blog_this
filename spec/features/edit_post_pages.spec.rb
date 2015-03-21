require 'rails_helper'

describe 'the edit a post process' do
  it 'edits the title of a preexisting post' do
    post = Post.create(
      title: 'Two weeks to go!',
      body: 'Man o man!'
    )
    visit post_path(post)
    click_on 'Edit Post'
    fill_in 'Title', with: 'Can you believe it?'
    click_on 'Update Post'
    expect(page).to have_content 'believe'
  end
end

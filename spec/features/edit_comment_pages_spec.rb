require 'rails_helper'

describe 'the edit a comment process' do
  it 'edits the body of a preexisting comment' do
    post = Post.create(
      title: 'Last nites Sonic Youth show',
      body: 'Thurston is the man!'
    )
    comment = post.comments.create( body: 'You know it!' )
    visit post_path(post)
    click_on 'Edit'
    fill_in 'Body', with: 'You know it man!'
    click_on 'Update Comment'
    expect(page).to have_content 'updated!'
  end
end

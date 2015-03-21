require 'rails_helper'

describe 'the delete a comment process' do
  it 'edits the body of a preexisting comment' do
    post = Post.create(
      title: 'Last nites Sonic Youth show',
      body: 'Thurston is the man!'
    )
    comment = post.comments.create( body: 'You know it!' )
    visit post_path(post)
    click_on 'Delete'
    expect(page).to have_content 'deleted!'
  end
end

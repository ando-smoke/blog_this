require 'rails_helper'

describe 'the add a comment process' do
  it "takes you to a new comment page" do
    post = Post.create(
      title: 'Last nites Sonic Youth show',
      body: 'Thurston is the man!'
    )
    visit post_path(post)
    click_on 'Add New Comment'
    expect(page).to have_content 'New Comment'
  end

  it 'adds a new comment to a post' do
    post = Post.create(
      title: 'Last nites Sonic Youth show',
      body: 'Thurston is the man!'
    )
    visit post_path(post)
    click_on 'Add New Comment'
    fill_in 'Body', with: 'My thoughts exactly.'
    click_on 'Create Comment'
    expect(page).to have_content 'exactly'
  end

  it 'gives an error when no comment body is entered' do
    post = Post.create(
      title: 'Last nites Sonic Youth show',
      body: 'Thurston is the man!'
    )
    visit new_post_comment_path(post)
    click_on 'Create Comment'
    expect(page).to have_content 'errors'
  end
end

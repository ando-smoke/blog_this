require 'rails_helper'

describe "the add a post process" do
  it "takes you to a new post page" do
    visit posts_path
    click_on 'Add New Post'
    expect(page).to have_content 'New Post'
  end

  it "adds a new post" do
    visit posts_path
    click_on 'Add New Post'
    fill_in 'Title', :with => 'My first week at camp'
    fill_in 'Body', :with => 'Best week ever!'
    click_on 'Create Post'
    expect(page).to have_content 'Posts'
  end

  it "gives error when no post title is entered" do
    visit posts_path
    click_on 'Add New Post'
    click_on 'Create Post'
    expect(page).to have_content 'errors'
  end
end

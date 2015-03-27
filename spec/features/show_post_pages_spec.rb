require 'rails_helper'

describe 'the show post detail process' do
  it 'shows the detail for a single post when clicked on ' \
    'from home page' do
    FactoryGirl.create(:post)
    visit posts_path
    click_on 'Best foodcarts in PDX'
    expect(page).to have_content 'foodcarts'
  end
end

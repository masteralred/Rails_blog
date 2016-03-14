require 'rails_helper'

feature 'Comment Creation' do
  before do
    sign_up
    create_article
  end

  scenario 'allows user to visit article page' do
    visit article_path(1)
    expect(page).to have_content 'New article body'
  end

  scenario 'allows user to create commentary' do
    visit article_path(1)
    fill_in :comment_body, :with => 'Some text'
    click_button 'Добавить'
    expect(page).to have_content 'Some text'
  end
end
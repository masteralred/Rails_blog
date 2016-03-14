require 'rails_helper'

feature 'Article Creation' do
  before(:each) do
    sign_up
  end

  scenario 'allows user to visit new article page' do
    visit new_article_path
    expect(page).to have_content I18n.t('articles.article_new')
  end

  scenario 'allows user to create new article' do
    visit new_article_path
    fill_in :article_title, :with => 'New article header'
    fill_in :article_text, :with => 'New article body'
    click_button 'Опубликовать'
    expect(page).to have_content 'New article body'
  end
end
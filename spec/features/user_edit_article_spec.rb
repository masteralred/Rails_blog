require 'rails_helper'

feature 'Article Edit' do
  before do
    sign_up
    create_article
    add_comment
  end

  scenario 'allows user to visit article edit page' do
    visit article_path(1)
    click_link 'Редактировать'
    expect(page).to have_content 'Edit article'
  end

  scenario 'allows user to edit article' do
    visit article_path(1)
    click_link 'Редактировать'
    
    fill_in :article_title, :with => 'New article header2'
    fill_in :article_text, :with => 'New article body2'
  
    click_button 'Save Article'

    expect(page).to have_content 'New article header2'
  end
end
def sign_up
  visit new_user_registration_path
    
  fill_in :user_email, :with => 'user@example.com'
  fill_in :user_username, :with => 'exampleusername'
  fill_in :user_password, :with => '12345678'
  fill_in :user_password_confirmation, :with => '12345678'

  click_button 'Sign up'
end

def create_article
  visit new_article_path
  
  fill_in :article_title, :with => 'New article header'
  fill_in :article_text, :with => 'New article body'
  
  click_button 'Опубликовать'
end

def add_comment
  visit article_path(1)
  
  fill_in :comment_body, :with => 'Some text'
  
  click_button 'Добавить'
end
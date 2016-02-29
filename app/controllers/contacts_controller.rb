class ContactsController < ApplicationController

  def new 
  end

  def create
    @contact = Contact.new contact_params
    if @contact.valid?
      @contact.save
      redirect_to contacts_confirmation_path   
    else
      render action: 'new'
    end
  end

  def confirmation
    @success = "Ваше сообщение отправлено, спасибо за отзыв!"
    render action: 'new'
  end

  private

  def contact_params
    params.require(:contact).permit(:email, :message)
  end

end

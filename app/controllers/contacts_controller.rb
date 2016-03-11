class ContactsController < ApplicationController

  def new
  end

  def create
    @contact = Contact.new contact_params
    if @contact.valid?
      @contact.save
      flash[:notice] = "Ваше сообщение отправлено, спасибо за отзыв!"
      redirect_to new_contacts_path   
    else
      render action: 'new'
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:email, :message)
  end

end

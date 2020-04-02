class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :edit, :update, :destroy]

  # GET /contacts
  # GET /contacts.json
  def index
    @contacts = current_user.contacts
  end

  # GET /contacts/1
  # GET /contacts/1.json
  def show
  end

  # GET /contacts/new
  def new
    if Contact.where(user_id: current_user.id).count == 5
      #TODO: make this alert call take style from _alerts
      #FIXME: validate this at model
      redirect_to contacts_path, :alert => 'You already have 5 contacts'
    else
      @contact = Contact.new
    end
  end

  # GET /contacts/1/edit
  def edit
  end

  # POST /contacts
  # POST /contacts.json
  def create
      @contact = Contact.new(contact_params)
      @contact.user_id = current_user.id

      if Contact.where(user_id: current_user.id, cellphone: @contact.cellphone).exists?
        #Checking if contact is already registed with this code
        #because using uniqueness: true at model will avoid 
        #different users having the same contact, which is a valid scenario
        #TODO: make this alert call take style from _alerts
        #FIXME: validate this at model with dedicated function
        redirect_to new_contact_path, :alert => 'You have already registered this contact'
      else
        respond_to do |format|
        if @contact.save
          format.html { redirect_to contacts_url, notice: 'Contact was successfully created.' }
          format.json { head :no_content }
        else
          format.html { render :new }
          format.json { render json: @contact.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /contacts/1
  # PATCH/PUT /contacts/1.json
  def update
    if Contact.where(user_id: current_user.id, cellphone: contact_params[:cellphone]).exists?
      #TODO: make this alert call take style from _alerts
      #FIXME, validate this at model with dedicated function
      redirect_to edit_contact_path, :alert => 'You have already registered this contact'
    else
      respond_to do |format|
        if @contact.update(contact_params)
          format.html { redirect_to contacts_url, notice: 'Contact was successfully updated.' }
          format.json { render :show, status: :ok, location: @contact }
        else
          format.html { render :edit }
          format.json { render json: @contact.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /contacts/1
  # DELETE /contacts/1.json
  def destroy
    @contact.destroy
    respond_to do |format|
      format.html { redirect_to contacts_url, notice: 'Contact was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = Contact.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def contact_params
      params.require(:contact).permit(:fname, :lname, :cellphone)
    end
end

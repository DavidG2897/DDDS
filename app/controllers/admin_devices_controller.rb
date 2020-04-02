class AdminDevicesController < ApplicationController
  before_action :set_admin_device, only: [:show, :edit, :update, :destroy]
  before_action :check_admin

  # GET /admin_devices
  # GET /admin_devices.json
  def index
    @admin_devices = AdminDevice.all
  end

  # GET /admin_devices/1
  # GET /admin_devices/1.json
  def show
  end

  # GET /admin_devices/new
  def new
    @admin_device = AdminDevice.new
  end

  # GET /admin_devices/1/edit
  def edit
  end

  # POST /admin_devices
  # POST /admin_devices.json
  def create
    @admin_device = AdminDevice.new(admin_device_params)

    respond_to do |format|
      if @admin_device.save
        format.html { redirect_to @admin_device, notice: 'Admin device was successfully created.' }
        format.json { render :show, status: :created, location: @admin_device }
      else
        format.html { render :new }
        format.json { render json: @admin_device.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin_devices/1
  # PATCH/PUT /admin_devices/1.json
  def update
    respond_to do |format|
      if @admin_device.update(admin_device_params)
        format.html { redirect_to @admin_device, notice: 'Admin device was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_device }
      else
        format.html { render :edit }
        format.json { render json: @admin_device.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin_devices/1
  # DELETE /admin_devices/1.json
  def destroy
    #FIXME check if admin device is associated with a user to update the user info
    @admin_device.destroy
    respond_to do |format|
      format.html { redirect_to admin_devices_url, notice: 'Admin device was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_device
      @admin_device = AdminDevice.find(params[:id])
    end

    def check_admin
      if current_user && current_user.admin
        return
      else
        redirect_to root_path, alert: 'You are not an admin'
      end
    end

    # Only allow a list of trusted parameters through.
    def admin_device_params
      params.require(:admin_device).permit(:serial)
    end
end

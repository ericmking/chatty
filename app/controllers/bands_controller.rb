class BandsController < ApplicationController
  before_action :get_band, only: [:show, :join, :invite]
  
  def index
    # Get all the bands that your user is in
    @bands = current_user.bands.all

    # If you've got more than one band, redirect to the session store band
    # If you're only in one band, redirect to that band page
    # If you're not in any bands, you should set one up
    if @bands.size > 0       
      redirect_to @band
    else # @bands.size < 1
      redirect_to new_band_path
    end
  end

  def show
    session[:current_band_id] = @band.id
  end

  def new
    @band = Band.new
  end

  def create
    @band = Band.new(band_params)

    if @band.save
      @band.add_user_to_band(current_user.id)

      flash[:success] = 'New band added.'

      redirect_to @band
    else
      @band.errors.each do |e|
        puts e
      end
      render 'new'
    end
  end

  def join
    @band.add_user_to_band(current_user.id)

    redirect_to @band
  end

  def invite
  end

  def send_invitation
    email = params[:email]
    message = params[:message]

    user = User.invite!(email: email)
    # We do this in anticipation of the user accepting
    @band.add_user_to_band(user.id)

    flash[:info] = "An invitation has been sent to #{email} to join #{@band.name}"

    redirect_to @band
  end

  private

  def get_band
    @band = Band.find_by(id: params[:id])
  end

  def band_params
    params.require(:band).permit(:name)
  end
end
class BandsController < ApplicationController
  def index
    # Get all the bands that your user is in
    @bands = current_user.bands.all

    # If you're only in one band, redirect to that band page
    # If you're not in any bands, you should set one up
    if @bands.size == 1
      redirect_to @bands.first
    elsif @bands.size < 1
      redirect_to new_band_path
    end
  end

  def show
    @band = Band.find_by(id: params[:id])
  end

  def new
    @band = Band.new
  end

  def create
    @band = Band.new(band_params)
    if @band.save
      band_member = BandMember.create!(
                                  band: @band,
                                  user: current_user
      )

      flash[:success] = 'New band added.'

      redirect_to @band
    else
      @band.errors.each do |e|
        puts e
      end
      render 'new'
    end
  end

  private

  def band_params
    params.require(:band).permit(:name)
  end
end
class GigsController < ApplicationController
  def index
    @gigs = @band.gigs.all.order(:start_date)
  end

  def new
    @gig = Gig.new
  end

  def create
    @gig = Gig.new(gig_params)
    @gig.band = @band

    if @gig.save
      redirect_to gigs_path
    else
      puts @gig.errors.inspect
      render 'new'
    end
  end

  private

  def gig_params
    params.require(:gig).permit(
      :name,
      :description,
      :start_date,
      :end_date,
      :location_venue,
      :location_address_1,
      :location_address_2,
      :location_city,
      :location_state,
      :location_postal_code,
      :location_country,
    )
  end
end
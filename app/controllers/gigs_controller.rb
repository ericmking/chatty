class GigsController < ApplicationController
  before_action :get_gig, only: [:show, :edit, :update, :delete, :copy]

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
      render 'new'
    end
  end

  def edit
  end

  def update
    @gig.update_attributes(gig_params)

    if @gig.save
      redirect_to gigs_path
    else
      render 'edit'
    end
  end

  def copy
    copied_gig = @gig.dup
    if copied_gig.save
      redirect_to copied_gig
    else
      render 'show'
    end
  end

  private

  def get_gig
    @gig = Gig.find_by(id: params[:id])
  end

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
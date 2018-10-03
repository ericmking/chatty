class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :get_bands
  before_action :get_current_band

  layout :layout_by_resource

  private

  def get_bands
    if current_user
      @bands = current_user.bands.all.uniq
    end
  end

  def get_current_band
    if @bands.size > 0
      if session[:current_band_id]
        @band = Band.find_by(id: session[:current_band_id])
      else
        @band = @bands.first
      end
    end
  end

  def layout_by_resource
    if !current_user
      "login"
    else
      "application"
    end
  end
end

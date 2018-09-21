class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :get_bands
  before_action :get_current_band

  layout :layout_by_resource

  private

  def get_bands
    @bands = current_user.bands.all
  end

  def get_current_band
    @band = @bands.first
  end

  def layout_by_resource
    if !current_user
      "login"
    else
      "application"
    end
  end
end

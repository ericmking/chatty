class Admin::BandsController < Admin::AdminController
  def index
    @bands = Band.all
  end
end
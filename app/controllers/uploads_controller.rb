class UploadsController < ApplicationController
  def index
    @uploads = Upload.all
  end

  def new
    @upload = Upload.new
  end

  def create
    @upload = current_user.uploads.build(upload_params)
    if @upload.save
      flash[:success] = 'New @upload added.'

      redirect_to uploads_path
    else
      render 'new'
    end
  end

  private

  def upload_params
    params.require(:upload).permit(:name)
  end
end

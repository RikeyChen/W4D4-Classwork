class AlbumsController < ApplicationController
  def show
    @album = Album.find_by(id: params[:id])
    render :show
  end

  def new
    @bands = Band.all
    render :new
  end

  def create
    album = Album.new(album_params)

    @band = Band.find_by(id: params[:id])
    album.band_id = @band.id

    if album.save
      redirect_to band_url(@band)
    else
      flash.now[:errors] = album.errors.full_messages
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def album_params
    params.require(:album).permit(:title, :year, :live)
  end
end

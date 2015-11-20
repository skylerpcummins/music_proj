class AlbumsController < ApplicationController

  def new
    @album = Album.new
  end

  def create
    @album = Album.new(album_params)

    if @album.save
      redirect_to albums_url
    else
      render :new
    end
  end

  def show
    @album = Album.find(params[:id])
  end

  def index
    @albums = Album.all
  end

  def edit
    @album = Album.find(params[:id])
    render :edit
  end

  def update
    @album = Album.find(params[:id])

    if @album.update(album_params)
      redirect_to band_url(@album.band_id)
    else
      render :index
    end
  end

  def destroy
    Album.find(params[:id]).destroy
    redirect_to albums_url
  end

  private
  def album_params
    params.require(:album).permit(:title, :style, :band_id)
  end
end

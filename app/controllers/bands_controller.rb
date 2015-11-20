class BandsController < ApplicationController

  def new
    @band = Band.new
  end

  def create
    @band = Band.new(band_params)

    if @band.save
      redirect_to bands_url
    else
      render :new
    end
  end

  def show
    @band = Band.find(params[:id])
  end

  def index
    @bands = Band.all
  end

  def edit
    @band = Band.find(params[:id])
    render :edit
  end

  def update
    @band = Band.find(params[:id])

    if @band.update(band_params)
      redirect_to band_url(@band)
    else
      render :index
    end
  end

  def destroy
    Band.find(params[:id]).destroy
    redirect_to bands_url
  end


  private
  def band_params
    params.require(:band).permit(:name)
  end
end

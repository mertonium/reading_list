class AnimatedGifsController < ApplicationController
  def index
    @animated_gifs = AnimatedGif.order('created_at DESC')
  end

  def new
    @animated_gif = AnimatedGif.new
  end

  def edit
    @animated_gif = AnimatedGif.find(params[:id])
  end

  def create
    @animated_gif = AnimatedGif.new(animated_gif_params)

    if @animated_gif.save
      redirect_to animated_gifs_path
    else
      render 'new'
    end
  end

  def update
    @animated_gif = AnimatedGif.find(params[:id])

    if @animated_gif.update(animated_gif_params)
      redirect_to animated_gifs_path
    else
      render 'edit'
    end
  end

  private

  def animated_gif_params
    params.require(:animated_gif).permit(:url, :alt)
  end
end

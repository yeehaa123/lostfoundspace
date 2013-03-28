class SlidesController < ApplicationController
  respond_to :json

  def index
    # respond_with Slide.where(:image_url)
    respond_with Slide.all
  end

  def show
    respond_with Slide.find(params[:id])
  end

  def create
    respond_with Slide.create(params[:slide])
  end

  def update
    respond_with Slide.update(params[:id], params[:slide])
  end

  def destroy
    respond_with Slide.destroy(params[:id])
  end
end

class SlidesController < ApplicationController
  respond_to :json, :csv

  def index
    @slides = Slide.scoped
    respond_with do |format|
      format.html
      format.json { render text: @slides.to_json }
      format.csv  { render text: @slides.to_csv }
    end
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

  def import
    Slide.import(params[:file])
    redirect_to root_url
  end
end

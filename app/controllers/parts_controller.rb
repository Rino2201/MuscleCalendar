class PartsController < ApplicationController
  def index
    @parts = Part.all
    @part = Part.new
  end

  def create
    @part = Part.new(part_params)
    @parts = Part.all
    if @part.save
      redirect_to parts_path
    else
      render :index
    end
  end

  def edit
    @part = Part.find(params[:id])
  end

  def update
    @part = Part.find(params[:id])
    if @part.update(part_params)
      redirect_to parts_path
    else
      render :edit
    end
  end

  private

  def part_params
    params.require(:part).permit(:part)
  end

end

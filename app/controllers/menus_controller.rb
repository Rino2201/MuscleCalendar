class MenusController < ApplicationController
  def index
    @menus = Menu.all
    @menu = Menu.new
  end

  def create
    @menu = Menu.new(menu_params)
    @menus = Menu.all
    if @menu.save
      redirect_to menus_path
    else
      render :index
    end
  end

  def edit
    @menu = Menu.find(params[:id])
  end

  def update
    @menu = Menu.find(params[:id])
    if @menu.update(menu_params)
      redirect_to menus_path
    else
      render :edit
    end
  end

  private

  def menu_params
    params.require(:menu).permit(:menu_name, :part_name)
  end

end

class TrainingsController < ApplicationController

  def new
    @training = Training.new
  end

  def create
    @training = Training.new(training_params)
    @training.user_id = current_user.id
    if @training.save
      redirect_to trainings_path
    else
      render :index
    end
  end

  def show
  end

  def index
    @trainings = Training.all
  end

  def edit
    @training = Training.find(params[:id])
  end

  def update
    @training = Training.find(params[:id])
    if @training.update(training_params)
      redirect_to trainings_path
    else
      render :edit
    end
  end

  def training_params
    params.require(:training).permit(:user_id, :menu_id, :weight, :rep, :set)
  end

end

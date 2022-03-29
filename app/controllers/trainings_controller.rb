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
    @training = Training.find(params[:id])
    @trainings = Training.where(start_time: @training.start_time)
  end

  def index
    # @trainings = Training.all
    # @training = Training.new
    @user = current_user
    @trainings = Training.where(user_id: @user).order(start_time: "desc").page(params[:page]).per(8)
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

  def destroy
    @training = Training.find(params[:id])
    @training.destroy
    redirect_to trainings_path
  end

  def training_params
    params.require(:training).permit(:user_id, :menu_id, :weight, :unit, :rep, :set, :start_time)
  end

end

class ExercisesController < ApplicationController
  def show
    @exercise = Exercise.find(params[:id])
  end

  def new
    @user = User.find(params[:user_id])
    @exercise = @user.exercises.new
  end

  def create
    @user = User.find(params[:user_id])
    @exercises = @user.exercises
    @exercise = @user.exercises.new(exercise_params)

    if @exercise.save
      flash[:success] = 'Exercise Entry Created'
      respond_to do |format|
        format.html { redirect_to user_path(@user) }
        format.js
      end
    else
      flash[:error] = 'Exercise Unable To Be Saved'
      redirect_to user_path(@user)
    end
  end

  private
  def exercise_params
    params.require(:exercise).permit(:name, :calories)
  end
end

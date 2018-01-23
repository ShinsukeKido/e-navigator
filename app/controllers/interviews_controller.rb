class InterviewsController < ApplicationController
  before_action :set_interview, only: [:edit, :destroy, :update, :approve]

  def index
    @user = User.find(params[:user_id])
    @interviews = @user.interviews.order("date ASC")
  end

  def new
    @interview = Interview.new
  end

  def create
    @interview = Interview.new(interview_params)
    if @interview.save
      redirect_to root_path, notice: '面接日程を作成しました'
    else
      flash.now[:alert] = '面接日程を作成できませんでした'
      render :new
    end
  end

  def update
    if @interview.update(interview_params)
      redirect_to root_path, notice: '面接日程を編集しました'
    else
      flash.now[:alert] = '面接日程を編集できませんでした'
      render :edit
    end
  end

  def approve
    @user = @interview.user
    @interviewer = User.find(params[:user_id])
    @interviews = Interview.where(user_id: @user.id).where.not(id: params[:id])
    if @interview.update(status: 1) && @interviews.update(status: 2)
      redirect_to root_path, notice: '面接日程を選択しました'
    else
      flash.now[:alert] = '面接日程を選択できませんでした'
      render :edit
    end
  end

  def destroy
    @interview.destroy
    redirect_to :root, notice: '面接日程を削除しました'
  end

  private

  def set_interview
    @interview = Interview.find(params[:id])
  end

  def interview_params
    params.require(:interview).permit(:date, :status).merge(user_id: params[:user_id])
  end

end

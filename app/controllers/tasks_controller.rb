class TasksController < ApplicationController


  def index
    @time = Date.today.strftime('%Y年%m月%d日')
    @taskcount = Task.count
    @tasks = Task.all
  end

  def new
    @task = Task.new
    @time = Date.today.strftime('%Y年%m月%d日')
    
  end

  def create
    @task = Task.new(params.require(:task).permit(:title, :startdate, :enddate, :wholeday, :memo))
    @time = Date.today.strftime('%Y年%m月%d日')
    if @task.save
      flash[:notice] = "スケジュールを新規登録しました"
      redirect_to :tasks
    else
      flash[:alert] = "スケジュールを登録できませんでした。"
      render :new,status: :unprocessable_entity

    end
  end

  def show
    @time = Date.today.strftime('%Y年%m月%d日')
    @task = Task.find(params[:id])
  end

  def edit
    @time = Date.today.strftime('%Y年%m月%d日')
    @task = Task.find(params[:id])
  end

  def update
    @time = Date.today.strftime('%Y年%m月%d日')
    @task = Task.find(params[:id])
    if @task.update(params.require(:task).permit(:title, :startdate, :enddate, :wholeday, :memo))
      flash[:notice] = "スケジュールID:#{@task.id}の情報を更新しました"
      redirect_to :tasks
    else
      flash[:alert] = "スケジュールを編集できませんでした。"
      render "edit",status: :unprocessable_entity
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    flash[:notice] = "ユーザーを削除しました"
    redirect_to :tasks
  end
end
class ExamsController < ApplicationController
  before_action :logged_in_user
  before_action :load_exam, only: [:show, :update]

  def index
    @exam = current_user.exams.build
    @categories = Category.all
    @exams = current_user.exams.recent.page(params[:page])
      .per_page Settings.per_page
  end

  def create
    @exam = current_user.exams.build exam_params
    if @exam.save
      flash[:success] = t "created_exam"
      respond_to do |format|
        format.js
      end
    else
      flash[:danger] = t "fail_created_exam"
    end
    redirect_to exams_path
  end

  def show
  end

  def update
  end

  private
  def exam_params
    params.require(:exam).permit :category_id
  end

  def load_exam
    @exam = Exam.find_by id: params[:id]
    unless @exam
      flash[:danger] = t "exam_not_found"
      redirect_to root_path
    end
  end
end

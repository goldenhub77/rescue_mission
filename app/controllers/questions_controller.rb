class QuestionsController < ApplicationController
  def index
    @recent_questions = Question.order(created_at: :desc)
  end

  def show
    @question = Question.find(params[:id])
  end

  def new
    @errors = nil
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to questions_path
    else
      @errors = @question.errors.full_messages
      render :new
    end
  end
  private

  def question_params
    params.require(:question).permit(:title, :description)
  end
end

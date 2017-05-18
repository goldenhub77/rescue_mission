class QuestionsController < ApplicationController
  def index
    @recent_questions = Question.order(created_at: :desc)
  end

  def show
    @errors = nil
    @question = Question.find(params[:id])
    @answers = @question.answers.order(created_at: :desc)
    @submitted_answer = @question.answers.new
  end

  def new
    @errors = nil
    @question = Question.new
  end

  def edit
    @errors = nil
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    @question.title = question_params[:title]
    @question.description = question_params[:description]
    if @question.save
      redirect_to questions_path
    else
      @errors = @question.errors.full_messages
      render :edit
    end
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

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to questions_path
  end
  private

  def question_params
    params.require(:question).permit(:title, :description)
  end
end

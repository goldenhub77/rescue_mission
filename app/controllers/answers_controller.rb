class AnswersController < ApplicationController

  def index
    @question = Question.find(params[:question_id])
    @answers = @question.answers
  end

  def show
    @question = Question.find(params[:question_id])
    @answer = @question.answers.find(params[:id])
  end

  def create
    @question = Question.find(answer_params[:question_id])
    @answers = @question.answers
    @submitted_answer = Answer.new(answer_params)
    if @submitted_answer.save
      redirect_to question_path(@question.id)
    else
      @errors = @submitted_answer.errors.full_messages
      render "questions/show"
    end
  end

  def vote_best
    @question = Question.find(vote_params[:question_id])
    @question.best_answer = vote_params[:answer_id].to_i
    @question.save
    redirect_to question_path(@question.id)
  end

  private

  def vote_params
    params.permit(:question_id, :answer_id)
  end

  def answer_params
    params.require(:answer).permit(:body, :question_id, :user_id)
  end
end

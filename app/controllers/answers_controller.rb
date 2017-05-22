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
    if current_user
      @best_answer = nil
      @question = Question.find(answer_params[:question_id])
      @submitted_answer = Answer.new(answer_params)
      if @submitted_answer.save
        redirect_to question_path(@question.id)
      else
        if !@question.best_answer.nil?
          @best_answer = @question.answers.where('id = ?', @question.best_answer).first.body
          @answers = @question.answers.where('id != ?', @question.best_answer).order(created_at: :desc)
        else
          @answers = @question.answers.order(created_at: :desc)
        end
        @errors = @submitted_answer.errors.full_messages
        render "questions/show"
      end
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def vote_best
    @question = Question.find(vote_params[:question_id])
    if current_user && @question.user_id === current_user.id
      @question.best_answer = vote_params[:answer_id].to_i
      @question.save
      redirect_to question_path(@question.id)
    else
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def vote_params
    params.permit(:question_id, :answer_id)
  end

  def answer_params
    params.require(:answer).permit(:body, :question_id, :user_id)
  end
end

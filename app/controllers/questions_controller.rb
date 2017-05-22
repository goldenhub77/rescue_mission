class QuestionsController < ApplicationController
  def index
    @recent_questions = Question.order(created_at: :desc)
  end

  def show
  @errors = nil
  @best_answer = nil
  @question = Question.find(params[:id])
  if !@question.best_answer.nil?
    @best_answer = @question.answers.where('id = ?', @question.best_answer).first.body
    @answers = @question.answers.where('id != ?', @question.best_answer).order(created_at: :desc)
  else
    @answers = @question.answers.order(created_at: :desc)
  end
  @submitted_answer = @question.answers.new
end

  def new
    if current_user
      @errors = nil
      @question = Question.new
    else
      flash[:notice] = "You must be signed in"
      redirect_to root_path
    end
  end

  def edit
    @question = Question.find(params[:id])
    if current_user && @question.user_id === current_user.id
      @errors = nil
    else
      redirect_to root_path
    end
  end

  def update
    @question = Question.find(params[:id])
    if current_user && @question.user_id === current_user.id
      @question.title = question_params[:title]
      @question.description = question_params[:description]
      if @question.save
        redirect_to questions_path
      else
        @errors = @question.errors.full_messages
        render :edit
      end
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def create
    if current_user
      @question = Question.new(question_params)
      @question.user_id = current_user.id
      if @question.save
        redirect_to questions_path
      else
        @errors = @question.errors.full_messages
        render :new
      end
    end
  end

  def destroy
    if current_user
      @question = Question.find(params[:id])
      if @question.user_id === current_user.id
        @question.destroy
        redirect_to questions_path
      end
    else
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def question_params
    params.require(:question).permit(:title, :description)
  end
end

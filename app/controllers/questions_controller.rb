class QuestionsController < ApplicationController

  def index
    @questions = Question.order(created_at: :desc).all
  end

  def show
    @question = Question.find(params[:id])
    @answers = @question.answers.order(:created_at)
    @answer = Answer.new
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      flash[:notice] = "Question submitted successfully!"
      redirect_to question_path(@question)
    else
      flash[:alert] = "Question not saved"
      render :new
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])

    if @question.update(question_params)
      flash[:notice] = "Question successfully edited!"
      redirect_to question_path(@question)
    else
      flash[:alert] = "Question not updated"
      render :edit
    end
  end

  def destroy
    Question.find(params[:id]).answers.destroy_all
    Question.find(params[:id]).destroy
    redirect_to "/"
  end

  private

  def question_params
    params.require(:question).permit(:title, :description)
  end

end

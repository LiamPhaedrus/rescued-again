class AnswersController < ApplicationController

  def create
    @answer = Answer.new(answer_params)
    @question = Question.find(params[:question_id])
    @answer.question = @question

    if @answer.save
      flash[:notice] = "Answer submitted successfully!"
      redirect_to question_path(@question)
    else
      flash[:alert] = "Answer not saved"
      render "questions/show"
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:body)
  end

end

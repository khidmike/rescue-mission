class AnswerController < ApplicationController

  def index
    @question = Question.find(params[:question_id])
    @answers = @question.answers
  end

  def new
    @question = Question.find(params[:question_id])
    @answer = Answer.new
  end

  def create
    @question = Question.find(params[:question_id])
    @answer = Answer.new(answer_params)
    @answer.question = @question

      if @answer.save
      #  flash[:notice] = "Answered"
       redirect_to question_path(@question)
      else
      #  flash[:error] = @answer.errors.full_messages.join(". ")
       render :new
      end
  end

  def show
    @answer = Answer.find(params[:id])
    @question = @question.product
  end

  private

  def answer_params
    params.require(:answer).permit(:body, params[:question_id])
  end



end

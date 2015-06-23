class AnswerController < ApplicationController

  def new
    @answer = Answer.new
  end

  def create
    @answer = Answer.new(answer_params)
       if @answer.save
         flash[:notice] = "Answered"
         redirect_to root_path
       else
         flash[:error] = @answer.errors.full_messages.join(". ")
         render :new
       end
  end

  def answer_params
    params.require(:answer).permit(:body)
  end

end

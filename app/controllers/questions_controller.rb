class QuestionsController < ApplicationController

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
       if @question.save
         flash[:notice] = "Question Added"
         redirect_to root_path
       else
         flash[:error] = @question.errors.full_messages.join(". ")
         render :new
       end
  end

  def question_params
    params.require(:question).permit(
      :title,
      :body
    )
  end

  def index
    @questions = []
    lists = 0
    while lists < Question.count
    @questions << [Question.all[lists].id, Question.all[lists].title, Question.all[lists].created_at, Question.all[lists].updated_at, Question.all[lists].body]
    lists+=1

    end
    @questions.sort_by! {|test, title, time| time}
  end

  def delete

  end

  def show
    @title = Question.all.where(id: params[:id].first)
  end
end

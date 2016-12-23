class HomeController < ApplicationController
  def index
    
    if params[:query]
      @questions = Question.text_search(params[:query]).paginate(:page => params[:page], :per_page =>2).order('created_at DESC')
    else
  	 @questions = Question.paginate(:page => params[:page], :per_page =>2).order('created_at DESC')
    end
    @answer = Answer.new
    @category = Category.all
  end
  def myques
  	@user = current_user
  	@questions = current_user.questions.paginate(:page => params[:page], :per_page =>2).order('created_at DESC')
  end
  def catques
  	 @questions = Question.where("category_id = ?", params[:id])
    @answer = Answer.new
    @category = Category.all
  end
end

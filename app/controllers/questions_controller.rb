class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!



  # GET /questions
  # GET /questions.json
  def index
    @questions = Question.all.sort {|a,b| b.created_at <=> a.created_at}
    @answer = Answer.new
    
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
    @answer = Answer.new
  end

  # GET /questions/new
  def new
    @question = Question.new

  end

  # GET /questions/1/edit
  def edit
  end

  # POST /questions
  # POST /questions.json
  def create
    @user = current_user
    @category = Category.find(params[:question][:category_id])
    @question = @user.questions.build(question_params)
    @question.category_id = @category.id

    respond_to do |format|
      if @question.save
      flash[:success] = 'Question was successfully created.'
        format.html { redirect_to @question }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  def update
    respond_to do |format|
      if 
        @category = Category.find(params[:question][:category_id])
        @question.category_id = @category.id
        @question.update(question_params)
        flash[:success] = 'Question was successfully updated.'
        format.html { redirect_to @question }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question.destroy
    respond_to do |format|
      flash[:success] = 'Question was successfully deleted.'
      format.html { redirect_to root_url }
      format.json { head :no_content }
      format.js
    end
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:question).permit(:content,:picture)
    end
   
end

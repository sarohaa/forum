class AnswersController < ApplicationController
  before_action :authenticate_user!
	
	def new
		@question = Question.find(params[:question_id])
		@answer = Answer.new

	end

	def create
		@question = Question.find(params[:question_id])
		@answer = @question.answers.build(answer_params)
		@answer.user = current_user
		@answer.save
		redirect_to :back
	end

	def destroy
		@question = Question.find(params[:question_id])
		@answer = @question.answers.find(params[:id]).destroy
		redirect_to :back
	end
	def upvote
		@question = Question.find(params[:question_id])
		@answer = Answer.find(params[:id])
		@answer.upvote_by current_user
		respond_to do |format|
        format.html { redirect_to root_path}
        format.json {}
        format.js {}
        end
    end
    def downvote
		@question = Question.find(params[:question_id])
		@answer = Answer.find(params[:id])
		@answer.downvote_by current_user
		respond_to do |format|
        format.html { redirect_to root_path}
        format.json {}
        format.js {}
        end
    end

	private
	def answer_params
		params.require(:answer).permit(:content)
	end


end
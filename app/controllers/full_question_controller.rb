class FullQuestionController < ApplicationController
  def index
    # @question = Question.find(params[:id])
  end

  def editor
    @question = Question.find(params[:question_id])
  end
end

class FullQuestionController < ApplicationController
 before_filter :signed_in_user, only: [:index]

  def editor
    @question = Question.find(params[:question_id])
  end

end

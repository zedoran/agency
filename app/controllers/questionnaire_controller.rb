class QuestionnaireController < ApplicationController
  before_filter :signed_in_user, only: [:index]
  def index
    @questionnaire = Question.order(:created_at).paginate(page: params[:page], :per_page => 2)
  end
end

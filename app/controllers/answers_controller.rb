class AnswersController < ApplicationController
  # GET /answers
  # GET /answers.json
  before_filter :signed_in_user, only: [:index]
  before_filter :admin_user,     only: [:new, :edit, :create, :update, :destroy]
  def index
    @answers = Answer.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @answers }
    end
  end

  # GET /answers/1
  # GET /answers/1.json
  def show
    @answer = Answer.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @answer }
    end
  end

  # GET /answers/new
  # GET /answers/new.json
  def new
    @answer = Answer.new
    @answer.question_id = params[:question_id]

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @answer }
    end
  end

  # GET /answers/1/edit
  def edit
    @answer = Answer.find(params[:id])
  end

  # POST /answers
  # POST /answers.json
  def create
    @answer = Answer.new(params[:answer]) #,params[:question_id])
  #  @answer.title = ''
    @answer.question_id = params[:answer][:question_id]
  #  @answer = @answer.build(question: question)
    question = Question.find(params[:answer][:question_id])

    if request.post?

      respond_to do |format|
        if @answer.save
          flash[:success] = t("success")
          format.html { redirect_to editor_path(question_id: question) }
        else
        format.html { render action: "new" }
      end

    end

  #    if @answer.save
  #      format.html { redirect_to @answer, notice: 'Answer was successfully created.' }
  #      format.json { render json: @answer, status: :created, location: @answer }
  #    else
  #      format.html { render action: "new" }
  #      format.json { render json: @answer.errors, status: :unprocessable_entity }
  #    end
    end
  end

  # PUT /answers/1
  # PUT /answers/1.json
  def update
    @answer = Answer.find(params[:id])

    respond_to do |format|
      if @answer.update_attributes(params[:answer])
        format.html { redirect_to @answer, notice: 'Answer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /answers/1
  # DELETE /answers/1.json
  def destroy
    @answer = Answer.find(params[:id])
    @answer.destroy

    respond_to do |format|
#      format.html { redirect_to answers_url }
      format.html { redirect_to :back }
      format.json { head :no_content }
    end
  end
end

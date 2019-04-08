class QuestionsController < ApplicationController

  before_action :find_question, only: %i[show delete]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def index
    questions = Test.find(params[:test_id]).questions

    render plain: questions.inspect
  end


  def show
    render inline: '<%= @question.body %>'
  end

  def new

  end

  def create
    question = Question.create(question_params)

    render plain: question.inspect
  end

  def destroy
    @question.destroy

    render plain: @question.inspect
  end

  private

  def find_question
    @question = Test.find(params[:test_id]).questions[params[:id].to_i]
  end

  def question_params
    params.require(:question).permit(:body, :test_id)
  end

  def rescue_with_test_not_found
    render plain: 'Test was not found'
  end

end

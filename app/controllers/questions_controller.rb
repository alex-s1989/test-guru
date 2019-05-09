class QuestionsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_test, only: %i[index create new]
  before_action :find_question, only: %i[show destroy update edit]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def index
    @questions = @test.questions
  end

  
  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end
  
  def rescue_with_test_not_found
    render plain: 'resource was not found', status: 404
  end

end

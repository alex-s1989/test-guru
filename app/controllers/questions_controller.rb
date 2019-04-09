class QuestionsController < ApplicationController
  
  
  before_action :find_test
  before_action :find_question, only: %i[show delete]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def index
    questions = @test.questions

    render plain: questions.inspect
  end


  def show
    render inline: '<%= @question.body %>'
  end

  def new

  end

  def create
    question = @test.questions.new(question_params)
    if question.save
      render plain: question.inspect
    else
      handle error
    end
  end

  def destroy
    @question.destroy

    render plain: @question.inspect
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = find_test.questions[params[:id].to_i]
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_with_test_not_found
    render plain: 'Test was not found', status: 404
  end

end

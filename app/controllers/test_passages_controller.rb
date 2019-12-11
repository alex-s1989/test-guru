class TestPassagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[show update result gist]
  
  def show
  
  end

  def result

  end

  def gist
    @gist = GistQuestionService.new(@test_passage.current_question).call
    
    flash_options =
      if @gist.id
        Gist.create(gist_params)
        { notice: (view_context.link_to t('.success'), @gist.html_url).html_safe }
      else
        { alert: t('.failure') }
      end
    
    redirect_to @test_passage, flash_options
  end
  
  def update
    @test_passage.accept!(params[:answer_ids])
    
    if @test_passage.complited?
      TestsMailer.completed_test(@test_passage).deliver_now
      current_user.badges << UserBadgesService.new(@test_passage).call
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end
  
  private
  
  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
  
  def gist_params
    { question: @test_passage.current_question,
      gist_url: @gist.html_url,
      user: current_user }
  end
  
end

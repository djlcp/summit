class VotesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_vote, only: [:update]

  def create
    @vote = @post.votes.new(vote_params.merge(user: current_user))

    if @vote.save
      flash[:success] = 'Thanks for voting'
    else
      flash[:error] = 'Something went wrong'
    end
    respond_to do |format|
      format.js {render layout: false, partial: 'questions/show'}
    end
  end

  def update
    if @vote.update(vote_params)
      flash[:success] = 'Thanks for voting'
    else
      flash[:warning] = 'Something went wrong'
    end
    respond_to do |format|
      format.js {render layout: false, partial: 'questions/show'}
    end
  end

  private

  def set_vote
    @vote = Vote.find(params[:id])
  end

  def vote_params
    params.require(:vote).permit(:direction)
  end
end
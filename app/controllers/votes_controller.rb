class VotesController < ApplicationController
  before_filter :find_party, only: [:create, :index]

  def create
    @party.votes.create(vote_params)
    redirect_to result_party_path(@party)
  end

  def find_party
    @party = Party.find(params[:party_id])
  end

  def vote_params
    params.require(:vote).permit!
  end
end

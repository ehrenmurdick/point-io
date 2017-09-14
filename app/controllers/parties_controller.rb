class PartiesController < ApplicationController
  before_filter :find_party, except: [:index, :create]

  def index
  end

  def result
  end

  def create
    @party = Party.create({"session_id":session.id})

    redirect_to party_path(@party)
  end

  def show
  end

  def update
    @party.votes.destroy_all
    redirect_to :back
  end

  def find_party
    @party = Party.find(params[:id])
  end

  def watch

  end
end

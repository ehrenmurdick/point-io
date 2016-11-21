class PartiesController < ApplicationController
  before_filter :find_party, except: [:index, :create]

  def index
  end

  def result
  end

  def create
    @party = Party.create
    redirect_to party_path(@party)
  end

  def show
  end

  def update
    @party.votes.destroy_all
    redirect_to party_path(@party)
  end

  def find_party
    @party = Party.find(params[:id])
  end
end

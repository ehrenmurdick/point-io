class PartiesController < ApplicationController
  before_filter :find_party, except: [:index, :create]

  def index
  end

  def result
  end

  def create
    @party = Party.create
  end

  def show
  end

  def reset
    @party.votes.destroy_all
  end

  def find_party
    @party = Party.find(params[:id])
  end
end

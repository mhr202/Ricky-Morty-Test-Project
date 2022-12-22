class RickymortiesController < ApplicationController
  require 'rickmorty'

  def index
    #byebug
    episodes = Rickmorty::Episode.new.all
    render json: episodes
  end

  private
end

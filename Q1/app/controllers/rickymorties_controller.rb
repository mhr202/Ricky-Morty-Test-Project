class RickymortiesController < ApplicationController
  require 'rickmorty'
  # require 'rest-client'

  def index
    RickymortyService.perform
  end
end

# app/services/rickymorty_service.rb
class RickymortyService < ApplicationService
  
  require 'json'
  require 'rest-client'

  def perform 
    parse_characters(get_episodes())
  end

  private

  def get_episodes
    Rickmorty::Episode.new.all
  end

  def get_characters(url)
    RestClient.get(url)
  end

  def parse_characters(episodes)
    episodes.each do |x|
      characters = x['characters'].map { |c| c = get_characters(c) }
      puts characters
    end
  end
end
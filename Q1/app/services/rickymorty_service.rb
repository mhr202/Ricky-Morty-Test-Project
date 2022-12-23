# app/services/rickymorty_service.rb
class RickymortyService < ApplicationService
  
  require 'json'
  require 'rest-client'

  def perform 
    parse_characters('https://rickandmortyapi.com/api/episode', [])
  end

  private

  def get(url)
    RestClient.get(url)
  end

  def get_episodes()

    url = 'https://rickandmortyapi.com/api/episode'
    puts get(url)
  end

  def get_character_ids(characters)
    characters.map {|c| c.split('/')[-1].to_i }
  end

  def get_episode_characters(episodes)
    characters = []
    episodes.each do |e|
      characters.concat(get_character_ids(e['characters']))
    end

    characters.uniq.sort
  end

  def find_character(characters, id)
    characters.each do |c|
      if c['id'] == id
        return c
      end
    end
  end

  def parse_characters(url, all_episodes)
    episodes = get(url)
    episodes = JSON.parse(episodes.body)
    characters = []
    characters = get_episode_characters(episodes['results'])
    all_episodes.concat(episodes['results'])

    puts ''
    puts ''
    character_objects = JSON.parse(get("https://rickandmortyapi.com/api/character/#{characters.join(',')}"))
    puts ''
    # puts character_objects

    # episodes['results'].each do |e|
    #   e.characters.each do |c|

    #   end
    # end
    episodes['results'].each do |e|

      puts ''
      puts "---------EPISODE #{e['id']}----------"

      puts ''
      puts ''
      episode_cahracters = []
      e['characters'].each do |c|
        # puts find_character(character_objects, c.split('/')[-1].to_i)
        episode_cahracters.append(find_character(character_objects, c.split('/')[-1].to_i))
      end
      e['characters'].replace(episode_cahracters)
      puts e
    end

    if episodes['info']['next'].present?
      parse_characters(episodes['info']['next'], all_episodes)
    end
  end
end
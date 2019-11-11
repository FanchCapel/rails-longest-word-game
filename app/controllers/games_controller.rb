require 'open-uri'
require 'json'

class GamesController < ApplicationController
  def new
    @letters = (0..8).map { ('a'..'z').to_a[rand(26)] }
  end

  def score
    response = open("https://wagon-dictionary.herokuapp.com/#{params[:word]}")
    json = JSON.parse(response.read)
    if json['found']
      @answer = "this is an English word"
    end
  end
end

require 'open-uri'
require 'json'
class GamesController < ApplicationController
  def new
    @letters = [*('A'..'Z')].sample(10).join
  end

  def score
    @letters = params[:letters]
    @word = params[:word]
    @exist = exist?(@word)
    @include = include?(@word, @letters)
  end

private

  def exist?(word)
    url = "https://wagon-dictionary.herokuapp.com/#{word}"
    json = JSON.parse(url.read)
    json["found"]
  end

  def include?(word, letters)
    word.chars.all? { |letter| word.count(letter) <= letter.count(letter) }
  end
end



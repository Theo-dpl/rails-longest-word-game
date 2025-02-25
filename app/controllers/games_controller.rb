require "open-uri"


class GamesController < ApplicationController
  def new
    @letters = ('a'..'z').to_a.sample(10)
    # @letters.each { |letter| letter }
  end
  def score
    @letters = params[:letters]
    url = "https://dictionary.lewagon.com/#{params[:word]}"
    word_api = URI.parse(url).read
    word_result = JSON.parse(word_api)
    # raise
    if word_result["found"] == true && word_result["word"].chars.all? { |char| @letters.include?(char) }
      @output = "Congratulations! #{word_result["word"]} is a valid English word!"
    elsif
      @output = "Sorry but #{word_result["word"]} does not seem to be a valid English word"
    else
      @output = "Sorry but #{word_result["word"]} can't be build out of"
    end
  end
end

# .chars pour mettre lettre par lettre
# a = "oui"
# letters = ["f", "o", "i"]
# a.chars.all? do |lettre|
#   letters.include?(lettre)
# end

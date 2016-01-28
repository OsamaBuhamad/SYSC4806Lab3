class DictionaryWordsController < ApplicationController
  def spellcheck
	input_word = params[:term]
	puts "we want to check the word #{input_word}"
  end
end

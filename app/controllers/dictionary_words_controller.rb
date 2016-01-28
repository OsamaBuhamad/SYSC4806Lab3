require "#{Rails.root}/app/models/web_spellchecker.rb"
class DictionaryWordsController < ApplicationController

  def spellcheck
	input_word = params[:term]
	puts "we want to check the word #{input_word}"
	webspellchecker = WebSpellchecker.new 
	

	hash_=Hash.new
	hash_["term"]= input_word
	if webspellchecker.correct(input_word)
	hash_["known"] = true	
	else 
	hash_["known"] = false 
	end 
	
	#[optional] “suggestions”=> [“first”, “second”, “third”]
	

 render json: hash_ 
	
  end
end

require "#{Rails.root}/app/models/web_spellchecker.rb"
class DictionaryWordsController < ApplicationController
 
 def spellcheck
 	webSpellchecker=WebSpellchecker.new
 	input_word = params[:term]
	puts input_word
	#render :text => "we want to check the word #{input_word}"
	if (not input_word.nil?)
	correct_words=webSpellchecker.correct(input_word)
	if(not correct_words.nil?)
		hash=Hash.new
		knownWord=correct_words.include? input_word
		if(knownWord)
			hash= {"term" => input_word, "known" => knownWord}
		else
			hash= {"term" => input_word, "known" => knownWord, "suggestions" =>correct_words}
		end
	render :json =>hash
	else
	render :text =>"Word doesnt exist "
  	end
	else
	render :text =>"No word was entered .Please enter a word!"
	end
	end
end

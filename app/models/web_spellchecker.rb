class WebSpellchecker < Spellchecker

#constructor.
  def initialize
  
    end

#OVERRITE CORRECT 
  #def correct(w)
   # return  ["testing","purposes"]
  #end

  def known(words)
	words_rec=DictionaryWord.select("word , count ").where(word: words).order(count: :desc)
	return words_rec.map{|a|  a[:word]}
  end 
end 

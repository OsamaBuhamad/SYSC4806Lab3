$(document).on 'page:change', -> # initialize current word to an empty string.
 wrd = ""

 #update this line with correct selector and event
 $("#blogpost_contents").keypress (e) -> 

  # get the 1-character string that the user typed
  inp = String.fromCharCode(e.which) 

  #if this was a letter (use .match method and regular expression)
  if (inp.match(/[a-z]/i)) 
 #add letter to current word
    wrd += inp
  else
    if (wrd.match(/\w+/i)) # if the current word is a sequence of letters
      $.get window.location.origin + "/spellcheck/" + wrd, (data) -> 

       # console.log(data)
        if (!data.known)

          #join suggestions in a single string

          aString = 'The word "' + data.term + '" is not a word, did you mean: ' + data.suggestions[0] + '?'
          $("#spellcheck").text(aString)
     wrd = ""  #empty the word again





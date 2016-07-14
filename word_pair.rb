# Given a list of words, find a pair with the highest score. 
# The score is determined by multiplying the lengths of the words by one another. 
#If the words share any letters in common then the pair's score is zero. 

# For example:
# The score of the pair ["hello", "say"] = 5 * 3 = 15
# The score of the pair ["hi", "hello"] = 0, because the words share the letter "h"

#This solution focuses on performance


# Checking whether two words have commom letters
def common_letter?(w1, w2)
	w1 = w1.downcase
	w2 = w2.downcase
	# Iterating through all the characters of w1, until finding a character
	# that w2 includes
	w1.each_char do |char1|
		return true if w2.include?(char1)
	end
    false
end	

def score_word_pair(w1, w2)
  # If the two words share character/s the method returns 0,
  # otherwise it returns the multiplication of the words' length
  if common_letter?(w1, w2)
  	return 0
  else
  	return w1.length * w2.length
  end
end

def get_highest_scoring_pair(words)

  # Sorting the words array by length, from longest to shortest	
  sorted_words = words.sort{|x, y| y.length <=> x.length}

  last_index = sorted_words.length - 1
  i = 0
  
  max_score = 0
  w1 = ''
  w2 = ''
  # If the length of the current word is smaller than the square root of the max_score,
  # We won't find higher score
  while (i <= last_index) && (sorted_words[i].length >= Math.sqrt(max_score))
  
    j = i + 1
    found = false

    # If the length of the current word is smaller than the square root of the max_score,
    # We won't find higher score
    while j <= last_index && !found && (sorted_words[i].length  * sorted_words[j].length >= max_score)
     
      score = score_word_pair(sorted_words[i], sorted_words[j])
      
      if score > max_score
        w1 = sorted_words[i]
        w2 = sorted_words[j]
        max_score = score
        found = true
      elsif score > 0 
        found = true  
      end
      j += 1
    end
    i += 1
  end
  # if all scores are zero, returning the first two words
  return w1, w2
end


# Running the method
WORDS_TO_SCORE = %w[something red anything green mother yellow father blue foo purple bar orange baz black white]
best_pair = get_highest_scoring_pair(WORDS_TO_SCORE)
best_score = score_word_pair(*best_pair)
puts "Highest scoring pair of words is #{best_pair.map(&:inspect).join ' and '} with a score of #{best_score}."

def caesar_string(original_string, shift_number)
  original_string_array = original_string.split("")
  
  shifted_indexes_array = original_string_array.map do |char| 
    letter?(char) ? get_new_letter_index(char, shift_number) : char
  end
  
  get_new_letters(shifted_indexes_array, original_string_array).join("")
end

def get_new_letter_index(letter, shift_number)
  alphabet = get_alphabet
  current_letter_index = alphabet.find_index(letter.downcase) + 1
  new_index = (current_letter_index + shift_number) % 26
end

def get_new_letters(shifted_indexes_array, original_string_array)
  
  alphabet = get_alphabet
  
  shifted_indexes_array.reduce([]) do |result, index|
    if index.is_a?(Integer) 
      result << alphabet[index - 1]
    else
      result << index
    end

    result
  end
end

def letter?(char)
  char.match?(/[[:alpha:]]/)
end

def get_alphabet
  ('a'..'z').to_a
end

def check_letter_case(letter, original_string_array, index)
  letter_to_check = original_string_array[index]
  
  if letter?(letter_to_check)
    return letter.upcase if letter_to_check == letter_to_check.upcase
  end

  letter.downcase
end

puts caesar_string('A', 5)
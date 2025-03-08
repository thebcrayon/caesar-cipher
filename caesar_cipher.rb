def caesar_string(original_string, shift_number)
  
  original_string_array = original_string.split("")
  
  original_indexes = original_string_array.map do |char|
    letter?(char) ? get_alphabet.find_index(char.downcase) + 1 : char
  end

  shifted_indexes = original_indexes.map do |index|
   index.is_a?(Integer) ? (index + shift_number) % 26 : index
  end
  
  new_string_array = shifted_indexes.map do |index|
    index.is_a?(Integer) ? get_alphabet[index - 1] : index
  end

  new_string_array.map.with_index do |char, idx|
    char_check = original_string_array[idx]
    char_check == char_check.upcase ? char.upcase : char
  end.join('')
  # shifted_indexes
end

def letter?(char)
  char.match?(/[[:alpha:]]/)
end

def get_alphabet
  ('a'..'z').to_a 
end

my_string = 'What a string!'
puts caesar_string(my_string, 5)
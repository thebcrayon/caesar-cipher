# frozen_string_literal: true

def caesar_string(original_string, shift_number)
  # Need to turn original string into array to get indexes
  # relative to the alphabet with #alphabet.
  original_indexes = indexes(original_string_array(original_string))

  # Mapping those indexes to move to the right 'shift_number'
  # of digits
  shifted_indexes = shifted_indexes(original_indexes, shift_number)

  # Grab the corresponding letter from the newly shifted index.
  # Using Modulo to account for shifts beyond 26 letters
  converted_array = new_string_array(shifted_indexes)

  # Check to see what letters are capitalized in original
  # string array and capitalizing the character at the
  # corresponding index of 'new_string_array'
  converted_array.map.with_index do |char, idx|
    char_check = original_string_array(original_string)[idx]
    char_check == char_check.upcase ? char.upcase : char
  end.join
end

def new_string_array(array)
  array.map do |index|
    index.is_a?(Integer) ? alphabet[index - 1] : index
  end
end

def indexes(array)
  array.map do |char|
    letter?(char) ? alphabet.find_index(char.downcase) + 1 : char
  end
end

def shift_indexes(array, shift_number)
  array.map do |index|
    index.is_a?(Integer) ? (index + shift_number) % 26 : index
  end
end

def original_string_array(str)
  str.chars
end

def letter?(char)
  char.match?(/[[:alpha:]]/)
end

def alphabet
  ('a'..'z').to_a
end

my_string = 'What a string!'
puts caesar_string(my_string, 5)

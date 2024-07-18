def caesar_cipher(string = 'Missing arguments', number_shift = 0)
  # Need a 2D array to hold current letter as an integer and if it's capitalized
  original_as_integers = string.split('').map do |letter|
    [get_index_by_char(letter), is_cap?(letter)]
  end
  
  # Shifting the value while maintaining value of is_cap?
  shifted_as_integers = original_as_integers.reduce([]) do |acc, current|
    num = current[0]
    if num.is_a?(Integer)
        num = (num += number_shift) % 26
    end
    acc.push([num, current[1]])
    acc
  end

  # Make and join the new characters together, passing each index and it's is_cap value to return character
  integers_to_letters = shifted_as_integers.reduce([]) { |acc, current|
  current_index = get_char_by_index(current[0], current[1]) 
  acc.push(current_index)
    acc
}.join()
integers_to_letters
end

def get_index_by_char(char)
  arr = get_alphabet()
  target_char = char.downcase
  if arr.include?(target_char)
    arr.find_index(target_char)
  else
    target_char
  end
end

def get_char_by_index(index, is_cap)
  arr = get_alphabet()
  if index.is_a?(Integer)
    char = arr[index]
    (is_cap) ? char.upcase : char
  elsif index == nil
    return " "
  else
    return index
  end
end

def get_alphabet()
  ('a'..'z').to_a
end

def is_cap?(letter)
  letter == letter.upcase
end

puts caesar_cipher()
puts caesar_cipher("What a string!")
puts caesar_cipher("What a string!", 5)
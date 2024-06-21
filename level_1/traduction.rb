MAP_TO_PIOU = {
  "A"=> "piou",
  "B"=>"ioup",
  "C"=>"poup",
  "D"=>"iiou",
  "E"=>"ioui",
  "F"=>"pipp",
  "G"=>"ouip",
  "H"=>"poui",
  "I"=>"ppou",
  "J"=>"ipip",
  "K"=>"oupi",
  "L"=>"pouu",
  "M"=>"piiu",
  "N"=>"piui",
  "O"=>"uiui",
  "P"=>"opui",
  "Q"=>"pupu",
  "R"=>"iupi",
  "S"=>"piuu",
  "T"=>"piup",
  "U"=>"piop",
  "V"=>"ipou",
  "W"=>"oupu",
  "X"=>"uopu",
  "Y"=>"iupu",
  "Z"=>"iupp",
  "!"=>"iipu",
  ","=>"iupo",
  "."=>"ipuu",
  "?"=>"ppip"
}

MAP_TO_HUMAN_LANGUAGE = MAP_TO_PIOU.invert

UNKNOWN_CHARACTER = '#'.freeze

module Translation

  def self.encode(string)
    puts "mapping to piou..."
    message_array = []
    array_of_words = string.upcase.split(' ')
    array_of_words.each do |word|
      message_as_array = word.chars.map do |letter|
        MAP_TO_PIOU.key?(letter) ? MAP_TO_PIOU[letter] : UNKNOWN_CHARACTER
      end
      message_array << message_as_array.join(' ')
    end
    result = message_array.join('  ')
    puts result
    result
  end

  def self.decode(string)
    puts 'mapping to human...'
    message_array = []
    array_of_words = string.downcase.split('  ')
    array_of_words.each do |word|
      word_as_array = word.split(' ')
      mapped_word_as_array = word_as_array.map do |piou|
        MAP_TO_HUMAN_LANGUAGE.key?(piou) ? MAP_TO_HUMAN_LANGUAGE[piou].downcase : UNKNOWN_CHARACTER
      end
      message_array << mapped_word_as_array.join
    end
    result = message_array.join(' ')
    puts result
    result
  end
end

if __FILE__ == $0
  method_name = ARGV.shift # Get the method name from the command-line arguments

  if method_name && Translation.respond_to?(method_name)
    Translation.send(method_name, *ARGV) # Call the method with the remaining arguments
  else
    puts "Method #{method_name} not found in Translation"
  end
end

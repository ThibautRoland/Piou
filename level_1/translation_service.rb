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

  def translate(way, string)
    # p MAP_TO_PIOU
    # p MAP_TO_HUMAN_LANGUAGE
    return mapping_to_piou(string.upcase) if way == 'to_piou'
    return mapping_to_human(string.downcase) if way == 'to_human'

    puts "wrong argument given to translate method for the way parameter, given argument -> #{way}"
  end

  private

  def mapping_to_piou(string)
    puts "mapping to piou..."
    message_array = []
    array_of_words = string.split(' ')
    array_of_words.each do |word|
      message_as_array = word.chars.map do |letter|
        MAP_TO_PIOU.keys.include?(letter) ? MAP_TO_PIOU[letter] : UNKNOWN_CHARACTER
      end
      message_array << message_as_array.join(' ')
    end
    message_array.join('  ')
  end

  def mapping_to_human(string)
    puts 'mapping to human...'
    message_array = []
    array_of_words = string.split('  ')
    array_of_words.each do |word|
      word_as_array = word.split(' ')
      mapped_word_as_array = word_as_array.map do |piou|
        MAP_TO_HUMAN_LANGUAGE.has_key?(piou) ? MAP_TO_HUMAN_LANGUAGE[piou].downcase : UNKNOWN_CHARACTER
      end
      message_array << mapped_word_as_array.join
    end
    message_array.join(' ')
  end
end

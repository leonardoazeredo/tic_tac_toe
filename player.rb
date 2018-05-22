class Player
  ROW_MAP = (:A..:C).zip(0..2).to_h
  attr_reader :marker

  def initialize(name, marker)
    @name = name
    @marker = marker
    @score = 0
  end

  def get_move
    [get_row, get_col]
  end

  def get_row
    loop do
      choice_prompt('row')
      input = gets
      choice = translate_row(input)
      return choice if choice
      puts "Invalid row"
    end
  end

  def translate_row(input)
    choice = ROW_MAP[input[0].upcase.to_sym]
    validate_choice(choice)
  end

  def get_col
    choice_prompt('col')
    gets.to_i - 1
  end

  def choice_prompt(string)
    puts 'pick a ${string}'
    print '> '
  end

  def validate_choice(choice)
    choice if (0..2).include?(choice)
  end

end

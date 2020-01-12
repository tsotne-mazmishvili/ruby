def check_win(table, symbol, turn_counter, min_move_for_win, table_dimensions)
  win = false
  return win if turn_counter < min_move_for_win #დაიწყოს შემოწმება როცა სვლების რაოდენობა მოგების საშუალებას იძლევა

  #ჰორიზონტალური ხაზების შემოწმება
  (0...table.length).step(table_dimensions) do |index|
    (table_dimensions).times do
      if table[index] == symbol
        win = true
        index += 1
      else
        win = false
        break
      end
    end
    return win if win
  end

  #ვერტიკალური ხაზების შემოწმება
  (0...table_dimensions).each do |index|
    (table_dimensions).times do
      if table[index] == symbol
        win = true
        index += table_dimensions
      else
        win = false
        break
      end
    end
    return win if win
  end

  #დიაგონალური(მარცხნიდან მარჯვნივ) ხაზის შემოწმება
  (0...table.length).step(table_dimensions + 1) do |index|
    if table[index] == symbol
      win = true
    else
      win = false
      break
    end
  end
  return win if win

  #დიაგონალური(მარჯვნიდან მარცხნივ) ხაზის შემოწმება
  (table_dimensions - 1...table.length - (table_dimensions - 1)).step(table_dimensions - 1) do |index|
    if table[index] == symbol
      win = true
    else
      win = false
      break
    end
  end
  return win if win
end


#სვლის გაკეთება მაგიდაზე
def make_move(table, table_visual, symbol, number)
  #ჰარების რაოდენობა კვადრატულ ფრჩხილებში([]) სიმეტრიის შესანარჩუნებლად
  spacing = number.length - symbol.length

  #ჰარების ჩასმის ლოგიკა ფრჩხილებს შორის სიმეტრიულად
  symbol_with_spacing = " " * (spacing - spacing / 2) + symbol.to_s + " " * (spacing / 2)

  table[number.to_i - 1] = symbol
  table_visual.sub(number, symbol_with_spacing)
end


#ამოწმებს შემოყვანილი რიცხვის ვალიდურობას
def validate_number(number, used_numbers, biggest_number)
  if (1..biggest_number).include?(number) == false  || used_numbers.include?(number)
    return false
  end
  true
end


def define_player_turn(turn_counter, player1, player2)
  if turn_counter % 2 == 0 #რადგან თამაშს იწყებს player1 ლუწი სვლები მისია
    return player1
  end
  player2
end


#მიღებული მასივისგან(table) ამზადებს მაგიდის ვიზუალს დასაბეჭდათ
def table_visualisation(table_dimensions, biggest_number, table)
  visualised_table = ""

  table.each do |number|
    #ჰარების რაოდენობა კვადრატულ ფრჩხილებში([]) სიმეტრიის შესანარჩუნებლად
    spacing = biggest_number.to_s.length - number.to_s.length

    #ჰარების ჩასმის ლოგიკა ფრჩხილებს შორის სიმეტრიულად
    visualised_table += "[" + (" " * (spacing - spacing / 2)) + number.to_s + (" " * (spacing / 2)) + "] "
    visualised_table += "\n\n" if number % table_dimensions == 0
  end
  return visualised_table
end


def user_interface(table_dimensions = 3)
  puts "|===============| Tic Tac Toe |===============|"

  puts "player1: "
  player1 = {"name" => gets.chomp(), "symbol" => "X"}
  puts "\nplayer2: "
  player2 = {"name" => gets.chomp(), "symbol" => "O"}

  turn_counter = 0
  max_possible_turn = table_dimensions ** 2
  biggest_number = max_possible_turn
  min_move_for_win = table_dimensions * 2 - 2

  table = (1..(biggest_number)).to_a
  table_visual = table_visualisation(table_dimensions, biggest_number, table)

  used_numbers = []

  puts "\n|--------| Game starts, good luck |--------|\n"
  while turn_counter < max_possible_turn
    puts table_visual

    turn = define_player_turn(turn_counter, player1, player2)

    puts turn["name"] + " chooses number: "
    recieved_number = gets.chomp().to_i

    puts "-----------------------------------------------\n"

    if validate_number(recieved_number, used_numbers, max_possible_turn)
      table_visual = make_move(table, table_visual, turn["symbol"], recieved_number.to_s)

      if check_win(table, turn["symbol"], turn_counter, min_move_for_win, table_dimensions)
        puts table_visual
        return "Winner is " + turn["name"] + ", ***congratulations*** "
      end

      used_numbers << recieved_number
    else
      puts "\n!!!Given number is already used or it is not number. try again!!!"
      redo
    end
    turn_counter += 1
  end

  return "\nGame ends in tie"
end


def main
  puts user_interface()
end

main

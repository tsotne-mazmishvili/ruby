def check_winner(values, turn)
  if values[1] == values[2] && values[1] == values[3]
    winner = "winner is #{turn}"
  elsif values[4] == values[5] && values[4] == values[6]
    winner = "winner is #{turn}"
  elsif values[7] == values[8] && values[7] == values[9]
    winner = "winner is #{turn}"
  elsif values[1] == values[4] && values[1] == values[7]
    winner = "winner is #{turn}"
  elsif values[2] == values[5] && values[2] == values[8]
    winner = "winner is #{turn}"
  elsif values[3] == values[6] && values[3] == values[9]
    winner = "winner is #{turn}"
  elsif values[1] == values[5] && values[1] == values[9]
    winner = "winner is #{turn}"
  elsif values[3] == values[5] && values[3] == values[7]
    winner = "winner is #{turn}"
  end
end

def tic_tac_toe(player1, player2)
  turn = ""
  turn_counter = 0
  winner = nil

  values = {1 => 1,
            2 => 2,
            3 => 3,
            4 => 4,
            5 => 5,
            6 => 6,
            7 => 7,
            8 => 8,
            9 => 9}

  table = "[#{values[1]}] [#{values[2]}] [#{values[3]}]\n[#{values[4]}] [#{values[5]}] [#{values[6]}]\n[#{values[7]}] [#{values[8]}] [#{values[9]}]"
  puts table

  while  turn_counter < 9
      #if even player1's turn
      puts "#{player1}'s turn" if turn_counter % 2 == 0
      puts "#{player2}'s turn" if turn_counter % 2 == 1

      puts "choose number "
      recieved_value = gets.chomp().to_i
      puts "------------------"
      #check if number is already used
      if (1..9).include?(recieved_value) == false || values[recieved_value] != values.keys[recieved_value - 1]
        puts "!!number is already used or wrong character!!"
        redo
      end

      values[recieved_value], turn = "X", player1 if turn_counter % 2 == 0
      values[recieved_value], turn = "O", player2 if turn_counter % 2 == 1

      table = "[#{values[1]}] [#{values[2]}] [#{values[3]}]\n[#{values[4]}] [#{values[5]}] [#{values[6]}]\n[#{values[7]}] [#{values[8]}] [#{values[9]}]"

      if turn_counter > 3
        winner = check_winner(values, turn)
        if winner
          return winner, table
          break
        end
      end

      puts table
      turn_counter += 1

    end
    return "tie"
end

def main
  puts "player1 name: "
  player1 = gets.chomp()
  puts "player2 name: "
  player2 = gets.chomp()

  puts tic_tac_toe(player1, player2)

end
main

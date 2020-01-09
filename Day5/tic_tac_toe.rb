def tic_tac_toe(player1, player2)
  turn = ""
  turn_counter = 0
  winners = [[1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], [1,5,9], [3,5,7]]
  player1_combination = []
  player2_combination = []

  values = [1,2,3,4,5,6,7,8,9]
  table = "[#{values[0]}] [#{values[1]}] [#{values[2]}]\n[#{values[3]}] [#{values[4]}] [#{values[5]}]\n[#{values[6]}] [#{values[7]}] [#{values[8]}]"
  puts table

  while  turn_counter < 9
      even_odd = turn_counter % 2
      #if even player1's turn
      puts "#{player1}'s turn" if even_odd == 0
      puts "#{player2}'s turn" if even_odd == 1

      puts "choose number "
      recieved_value = gets.chomp().to_i
      puts "------------------"

      #check if number is already used
      if (1..9).include?(recieved_value) == false || values[recieved_value - 1] != recieved_value
        puts "!!number is already used or wrong character!!"
        redo
      end

      if even_odd == 0
        values[recieved_value - 1], turn = "X", player1
        player1_combination << recieved_value
      elsif even_odd == 1
        values[recieved_value - 1], turn = "O", player2
        player2_combination << recieved_value
      end

      table = "[#{values[0]}] [#{values[1]}] [#{values[2]}]\n[#{values[3]}] [#{values[4]}] [#{values[5]}]\n[#{values[6]}] [#{values[7]}] [#{values[8]}]"

      if turn_counter > 3
        winners.each do |x|
          return "Winner is: #{player1}" if (x - player1_combination).empty?
          return "Winner is: #{player2}" if (x - player2_combination).empty?
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

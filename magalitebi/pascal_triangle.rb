#პასკალის სამკუთხედი.
#კოდი გვეხმარება ვიზუალიზაცია გავუკეთოთ პასკალის სამკუთხედს მომხმარებლის მიერ შეყვანილი რიგის რაოდენობის მიერ.

def build_rows(number_of_rows = 15)
    #აბრუნებს მომხმარებლის მიერ შეყვანილ რიგების რაოდენობის(number_of_rows) მიხედვით დაგენერირებულ პასკალის
    #სამკუთხედის რიცხვებს, რომელიც წარმოდგენილია array-ს სახით.

    rows = [[1],[1,1]]

    (1..number_of_rows ).each do |index_of_row|
        last_row = rows[-1]
        new_row = [1,1]

        (0...last_row.length - 1).each do |i|
            new_row.insert(-2, last_row[i] + last_row[i + 1])
        end

        rows.append(new_row)
        number_of_rows -= 1
    end

    return rows
end


def calculate_spacing(rows)
    #მიღებული პასკალის სამკუთხედის რიცხვების(rows) მიხედვით, ითვლის თითოეული რიგისთვის საჭირო space-ებს,
    #რომლებიც უნდა ჩაისვას თითოეული რიგის წინ სიმეტრიული გამოსახუებისთვის ტერმინალში გამოტანისას.
    #თუ რიგის სიგრძე არის ლუწი, მაშინ შუაში ვამატებთ ერთ space-ს სიმეტრიულობისთვის.

    spacing_for_each_row = {}

    if rows[-1].join(" ").length % 2 == 0
        front_spacing = rows[-1].join(" ").length / 2 - 1
    else
        front_spacing = rows[-1].join(" ").length / 2
    end

    spacing_for_each_row[rows[0]] = front_spacing

    rows.each_with_index do |row, index_of_row|
        next if index_of_row == 0
        if row.join(" ").length % 2 == 0
            middle_element = row[row.length / 2]

            row[row.length / 2] = middle_element.to_s[0, middle_element.to_s.length / 2] \
                                  + " " + middle_element.to_s[middle_element.to_s.length / 2, middle_element.to_s.length]
        end

        front_spacing -= (row.join(" ").length - rows[index_of_row - 1].join(" ").length ) / 2

        spacing_for_each_row[row] = front_spacing
    end

    spacing_for_each_row
end

def print_pascal(spacing_for_each_row)
    #ტერმინალში გამოაქვს გამოსახულება, თითოეული რიგისთვის გამოთვლილი spacing მონაცემის(spacing_for_each_row) მიხედვით.

    spacing_for_each_row.each do |row, front_spacing|
        puts " " * front_spacing + row.join(" ")
    end
end


def main()
    print "Enter number of rows:"
    number_of_rows = gets.chomp()
    print_pascal(calculate_spacing(build_rows(number_of_rows.to_i)))
end

main()

require_relative 'find_palindrom'

class CheckPalindroms < FindPalindrom
  attr_reader  :result

  def checkpalindroms
    range_five = []
    @result = nil
    @max_pattern.downto(@min_pattern) do |pattern|
        palindroms = palindroms_from_pattern(pattern)

        if exist_multiple?(palindroms[0])
            @result = palindroms[0]
            break

        end
        range_five << palindroms[1]
    end

    if result.nil?
        range_five.each do |item|
            if exist_multiple?(item)
                @result = item
                break
            end
        end
    end

  end

end

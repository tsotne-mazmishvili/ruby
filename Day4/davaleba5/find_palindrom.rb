class FindPalindrom
  def initialize
    @in_palindrom = 10001
    @max_palindrom = 997799
    @min_pattern = 100
    @max_pattern = 1000
  end

  def palindroms_from_pattern(pattern)
      pattern_str = pattern.to_s
      [ (pattern_str + pattern_str.reverse).to_i, (pattern_str + pattern_str.reverse[1..-1]).to_i ]
  end

  def exist_multiple?(palindrome)
      root = Math.sqrt(palindrome).to_i
      return false if root > Math.sqrt(@max_palindrom).round
      root.downto(@min_pattern) do |item|
          return false if palindrome / item > Math.sqrt(@max_palindrom).round
          return true if palindrome % item == 0
      end
      false
  end
end

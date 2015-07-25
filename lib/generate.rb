class Generate
  FILTER = [
    %w(A 4 H),
    %w(B 8 3),
    %w(C G 6 c e),
    %w(E F f),
    %w(I L 7 J T Y i j l y),
    %w(M N W X),
    %w(O 0 Q a o),
    %w(P R p),
    %w(S 5 2 Z s),
    %w(U V u v),
    %w(g 9 q),
    %w(n m h),
    %w(K k)
   ]

  def self.possibles(word)
    words = Array.new

    word.chars.each do |letter|
      FILTER.each do |collection|
        if collection.include?letter
          collection.each {|c| words << word.gsub(letter, c)}
        end
      end
    end

    words
  end
end

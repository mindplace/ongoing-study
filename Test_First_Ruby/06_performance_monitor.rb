def measure(num=0, &block)
    if num == 0
        now = Time.now
        num = 1 
        num.times{yield}
        return Time.now - now
    elsif num != 0
        if num.class == Array
            average = []
            num.each do |i|
                now = Time.now
                i.times{yield}
                average << (Time.now - now)
            end
            return average.inject(:+) / num.length
        elsif num.class == Fixnum
            now = Time.now
            average = []
            num.times do 
                now = Time.now
                yield
                average << Time.now - now
            end
            return average.inject(:+) / num
        end
    end
end
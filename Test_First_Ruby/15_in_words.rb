class Fixnum
    def in_words
        number = self
        return "zero" if number == 0

        number_string = ""

        ones_place = ["one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]
        tens_place = ["ten", "twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety"]
        teenagers = ["eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen"]

        # setting trillions
        number_left = number
        number_writing = number_left / 1000000000000
        number_left -= (number_writing * 1000000000000)
        
        if number_writing > 0
            trillions = number_writing.in_words
            number_string += trillions + " trillion"
            number_string += " " if number_left > 0
        end
            
        # setting billions
        number_writing = number_left / 1000000000
        number_left -= number_writing * 1000000000
        
        if number_writing > 0
            billions = number_writing.in_words
            number_string += billions + " billion"
            number_string += " " if number_left > 0
        end
        
        # setting millions
        number_writing = number_left / 1000000
        number_left -= (number_writing * 1000000)

        if number_writing > 0
            millions = number_writing.in_words
            number_string += millions + " million"
            number_string += " " if number_left > 0
        end

        # setting thousands
        number_writing = number_left / 1000
        number_left -= (number_writing * 1000)

        if number_writing > 0
            thousands = number_writing.in_words
            number_string += thousands + " thousand"
            number_string += " " if number_left > 0
        end

        # setting hundreds
        number_writing = number_left / 100
        number_left -= (number_writing * 100)

        if number_writing > 0
            hundreds = number_writing.in_words
            number_string += hundreds + " hundred"
            number_string += " " if number_left > 0
        end

        # setting tens
        number_writing = number_left / 10
        number_left -= (number_writing * 10)

        if number_writing > 0
            if ((number_writing == 1) && (number_left > 0))
            number_string += teenagers[number_left - 1]
            number_left = 0
            else number_string += tens_place[number_writing - 1]
            end

            number_string += " " if number_left > 0
        end

        # setting ones
        number_writing = number_left
        number_string += ones_place[number_writing - 1] if number_writing > 0

        # return string
        number_string
    end
end
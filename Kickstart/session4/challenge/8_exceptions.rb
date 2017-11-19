# Write a method that receives a number 1 through 5.
# Depending on the value of the number, it will raise
# some particular type of exception.
#
# HINT:
#   All exceptions and errors are descendants of Exception.
#   (Exception is listed as an ancestor)
#
# Examples:
#   exception_raiser 1   # =>   #<RuntimeError: No 1s allowed!>
#   exception_raiser 2   # =>   #<ArgumentError: No 2s allowed!>
#   exception_raiser 3   # =>   #<Exception: No 3s allowed!>
#   exception_raiser 4   # =>   #<SyntaxError: No 4s allowed!>
#   exception_raiser 5   # =>   #<RubyKickstartException: No 5s allowed!>

class RubyKickstartException < Exception; end

def exception_raiser(num)
  return unless (1..5).include?(num)
  
  message = "No #{num}s allowed!"

  exception_type = {
    "1" => "RuntimeError",
    "2" => "ArgumentError",
    "3" => "Exception",
    "4" => "SyntaxError",
    "5" => "RubyKickstartException"
  }

  eval("raise #{exception_type[num.to_s]}, '#{message}'")
end

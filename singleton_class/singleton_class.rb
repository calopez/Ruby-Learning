str = "I am a string object"

class << str    
  def twice # <--- Singleton object method
    self + " " + self
  end
end

p str.twice

# Alternatively:

def str.twice
  self + " ++ " + self
end

p str.twice

# the difference between these two ways is in the page 392 -
# -- The well grounded rubyist 2 --


# By far the most frequent use of the class << object notation
# for entering a singleton- method class is in connection
# with class-method definitions:

class Ticket 
  class << self  # <--- Singleton class method
    def most_expensive(*tickets)
      tickets.max_by(&:price)
    end
  end
end

# which is the same that:

class << Ticket 
  def most_expensive(tikets)
    # etc.
  end
end

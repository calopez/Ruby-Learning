p ('a'..'z').map.with_index {|letter, i | [letter, i]}

# Listing 10.2 An exclusive-or method for strings


class String
  def ^(key)
    kenum = key.each_byte.cycle
    each_byte.map {  |byte| byte ^ kenum.next}.pack("C*")
  end
end


f = "carlos"
s = "lopez"

p a = f^s
p b = a^s


x = (1..Float::INFINITY).lazy.select { |n| n % 3 == 0 }.first(10)
p x
# Alternatively:
y = (1..Float::INFINITY).lazy.select { |n| n % 3 == 0 }
p  y.take(10).force



    
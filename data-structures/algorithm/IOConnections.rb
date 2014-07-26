module  IOConnections
  def read_user_inputs
    nodes = Array.new
    input = ''
    begin
      puts "Enter a couple nodes connected"
      input = gets; input ||= ''; input.chomp!
      n1, n2 = input.split(',')
      nodes.push([Integer(n1), Integer(n2)]) unless n1.nil? or n2.nil?
    end while n1 and n2 
    return nodes
  end
end
require_relative 'node'

class Bst
  attr_reader :initial, :data

  def initialize(initial_data)
    @initial = Node.new(data: initial_data)
    @data = initial_data
  end

  def insert(data, current_node = initial)
    placement = if data <= current_node.data
      {set_left: current_node.left}
    else
      {set_right: current_node.right}
    end
    return current_node.send(placement.keys.first, Node.new(data: data)) if placement.values.first.nil?
    insert(data, placement.values.first)
  end

  def left
    initial.left
  end
  #
  # def right
  #
  # end
end

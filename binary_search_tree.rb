require_relative 'node'

class Bst
  attr_reader :initial, :data

  def initialize(initial_data)
    @initial = Node.new(data: initial_data)
    @data = initial_data
  end

  def insert(data, current_node = initial)
    placement = data <= current_node.data ? 'left' : 'right'
    if current_node.send(eval":#{placement}").nil?
      return current_node.send(eval(":set_#{placement}"), Node.new(data: data))
    else
      insert(data, placement.values.first)
    end
  end

  def left
    initial.left
  end

  def right
    initial.right
  end
end

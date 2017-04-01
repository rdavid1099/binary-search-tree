require_relative 'node'

class Bst
  attr_reader :initial, :data

  def initialize(initial_data)
    @initial = Node.new(data: initial_data)
    @data = initial_data
  end

  def insert(data, current_node = initial)
    placement = data <= current_node.data ? 'left' : 'right'
    next_node = current_node.send(:"#{placement}")
    return current_node.send(:"set_#{placement}", Node.new(data: data)) if next_node.nil?
    insert(data, next_node)
  end

  def left
    initial.left
  end

  def right
    initial.right
  end
end

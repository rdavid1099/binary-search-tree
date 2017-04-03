require_relative 'node'
class Bst
  VERSION = 1
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

  def each(&block)
    in_order = get_in_order
    return in_order.each if block == nil
    in_order.each { |data| block.call(data) }
  end

  private
  def get_in_order(node = initial, result = [])
    if node
      get_in_order(node.left, result)
      result << node.data
      get_in_order(node.right, result)
    end
    result
  end
end

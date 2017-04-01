class Node
  attr_reader :data, :left, :right

  def initialize(**params)
    @data = params[:data]
    @left = params[:left]
    @right = params[:right]
  end

  def set_left(node)
    @left = node
  end

  def set_right(node)
    @right = node
  end
end

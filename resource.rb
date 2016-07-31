class Resource
  attr_reader :max

  def initialize(value,max = nil)
    @current = value
    @max = max || value
  end

  def +(value)
    @current += value
    if @current > @max
      @current = @max
    end
    self
  end

  def -(value)
    @current -= value
    if @current < 0
      @current = 0
    end
    self
  end

  def to_s
    @current.to_s
  end

  def ==(value)
    @current == value
  end

  def method_missing(name, *args, &blk)
    ret = @current.send(name, *args, &blk)
    ret.is_a?(Numeric) ? Resource.new(ret,@max) : ret
  end
end

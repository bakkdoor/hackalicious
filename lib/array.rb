class Array
  def rest
    self[1..-1]
  end
  alias_method :old_inspect, :inspect

  def inspect
    old_inspect.gsub(", ", " ")
  end
end

class Lisp::Parser::AST::ExpressionList
  def << exp
    @expressions.unshift(exp)
  end
  def eval(context)
    val = nil
    @expressions.each do |e|
      val = e.eval(context)
    end
    return val
  end

  def inspect
    @expressions.map(&:inspect)
  end

  def empty?
    @expressions.empty?
  end

  def bytecode(g)
    pos(g)
    size = @expressions.size
    @expressions.each do |expr|
      size -= 1
      expr.bytecode(g)
      g.pop if size > 0
    end
  end
end

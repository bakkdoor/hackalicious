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
end

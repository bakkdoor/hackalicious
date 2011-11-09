class Lisp::Parser::AST::ExpressionList
  def eval(context)
    val = nil
    @expressions.each do |e|
      val = e.eval(context)
    end
    return val
  end
end

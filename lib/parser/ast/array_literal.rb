class Lisp::Parser::AST::ArrayLiteral
  def eval(context)
    @expressions.map do |e|
      e.eval(context)
    end
  end
end

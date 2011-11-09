class Lisp::Parser::AST::Literal
  def eval(context)
    return @value
  end
end

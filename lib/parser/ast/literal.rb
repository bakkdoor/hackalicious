class Lisp::Parser::AST::Literal
  def eval(context)
    return @value
  end

  def to_sym
    @value.to_sym
  end
end

class Lisp::Parser::AST::Literal
  def eval(context)
    return @value
  end

  def to_sym
    @value.to_sym
  end

  def inspect
    @value.inspect
  end

  def bytecode(g)
    g.push_literal @value
  end
end

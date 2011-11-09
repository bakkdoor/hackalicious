class Lisp::Parser::AST::Identifier
  def eval(context)
    return context.get(@name)
  end

  def to_sym
    @name
  end
end

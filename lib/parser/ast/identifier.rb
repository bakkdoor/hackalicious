class Lisp::Parser::AST::Identifier
  def eval(context)
    return context.get(@name)
  end
end

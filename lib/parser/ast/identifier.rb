class Lisp::Parser::Identifier
  def eval(context)
    return context.get(@name)
  end
end

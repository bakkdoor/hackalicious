class Lisp::Parser::AST::Identifier
  def eval(context)
    return context.get(@name)
  end

  def to_sym
    @name
  end

  def inspect
    @name
  end

  def bytecode(g)
    Rubinius::AST::LocalVariableAccess.new(@line, @name).bytecode(g)
  end
end

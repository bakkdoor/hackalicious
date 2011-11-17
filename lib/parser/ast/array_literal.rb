class Lisp::Parser::AST::ArrayLiteral
  def eval(context)
    @expressions.map do |e|
      e.eval(context)
    end
  end

  def inspect
    "[" + @expressions.map(&:inspect).join(" ") + "]"
  end

  def bytecode(g)
    Rubinius::AST::ArrayLiteral.new(0, @expressions)
  end
end

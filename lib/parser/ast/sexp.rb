class Lisp::Parser::AST::Sexp
  include Enumerable

  def eval(context)
    method_name, *args = @expressions
    method = method_name.eval(context)
    method.call(context, *args)
  end
  def [] index
    @expressions[index]
  end

  def each(&block)
    @expressions.each(&block)
  end
end

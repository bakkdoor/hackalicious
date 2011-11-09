class Lisp::Parser::AST::Sexp
  def eval(context)
    method_name, *args = @expressions
    method = method_name.eval(context)
    context.get(method).call(context, *args)
  end
end

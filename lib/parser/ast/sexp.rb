class Lisp::Parser::AST::Sexp
  include Enumerable

  def eval(context)
    function_name, *args = @expressions
    function = function_name.eval(context)
    function.call(context, *args)
  end
  def [] index
    @expressions[index]
  end

  def each(&block)
    @expressions.each(&block)
  end

  def first
    @expressions.first
  end

  def rest
    @expressions[1..-1]
  end

  def inspect
    "(" + @expressions.map(&:inspect).join(" ") + ")"
  end

  def bytecode(g)
    function_name, *args = @expressions

    # always send to self
    function_name.bytecode(g)
    args.each{ |a| a.bytecode(g) }
    g.send :call, args.size, false
  end
end

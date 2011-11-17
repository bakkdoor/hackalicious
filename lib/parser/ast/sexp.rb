class Lisp::Parser::AST::Sexp
  include Enumerable

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

    # check for def
    if function_name.is_a? Lisp::Parser::AST::Identifier
      case function_name.name
        when :def
        return Lisp::Define.new(@line, *args).bytecode(g)
        when :defn
        return Lisp::Defn.new(@line, *args).bytecode(g)
        when :"."
        return Lisp::MethodCall.new(@line, *args).bytecode(g)
      end
    end

    # always send to self
    function_name.bytecode(g)
    args.each{ |a| a.bytecode(g) }
    g.send :call, args.size, false
  end
end

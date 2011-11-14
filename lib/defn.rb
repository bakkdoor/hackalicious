module Lisp
  class Defn
    def initialize(line, name, args, *body)
      @line = line
      @name = name
      @args = args
      @body = Lisp::Parser::AST::ExpressionList.new(@line, body)
    end

    def bytecode(g)
      Define.new(@line, @name, Function.new(@line, @args, @body)).bytecode(g)
    end
  end
end

module Lisp
  class Fn
    def call(context, *args)
      arguments = args[0].expressions
      body = Lisp::Parser::AST::ExpressionList.new(args[1..-1])
      Function.new(arguments, body)
    end
  end
end

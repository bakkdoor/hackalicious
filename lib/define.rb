module Lisp
  class Define
    def initialize(line, ident, value)
      @line = line
      @ident = ident
      @value = value
    end

    def bytecode(g)
      Rubinius::AST::LocalVariableAssignment.new(0, @ident.name, @value).bytecode(g)
    end
  end
end

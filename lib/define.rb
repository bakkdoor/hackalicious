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

  class OuterDefine
    def initialize(steps = 1)
      @steps = steps
    end
    def call(context, *args)
      parent = nil
      @steps.times do
        parent = context.parent
        if parent
          value = args[1].eval(context)
          parent.set(args[0].to_sym, value)
        else
          break
        end
      end
    end
  end
end

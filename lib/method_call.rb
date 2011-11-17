module Lisp
  class MethodCall
    def initialize(line = nil, object = nil, method = nil, *args)
      @line = line
      @object = object
      @method = method
      @args = args
    end

    def bytecode(g)
      @object.bytecode(g)
      @args.each{ |a| a.bytecode(g) }
      g.send @method.name, @args.size, true
    end
  end
end

module Lisp
  class MethodCall
    def initialize(line = nil, object = nil, method = nil, *args)
      @line = line
      @object = object
      @method = method
      @args = args
    end

    def call(context, *args)
      receiver, method_name, *args = args
      receiver = receiver.eval(context)
      method_name = method_name.to_sym
      args = args.map{ |a| a.eval(context) }

      receiver.send(method_name, *args)
    end

    def bytecode(g)
      @object.bytecode(g)
      @args.each{ |a| a.bytecode(g) }
      g.send @method.name, @args.size, true
    end
  end
end

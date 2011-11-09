module Lisp
  class BuiltinFunction
    def initialize(&block)
      @block = block
    end
    def call(context, *args)
      # strict argument evaluation, not lazy:
      vals = args.map{ |a| a.eval(context) }
      # call the block
      @block.call(*vals)
    end
  end

  class Function
    def initialize(args, body)
      @args = args
      @body = body
    end

    def call(context, *args)
      call_context = Context.new(context)
      @args.each_with_index do |arg, i|
        call_context.set(arg.to_sym, args[i].eval(call_context))
      end
      @body.eval(call_context)
    end
  end
end

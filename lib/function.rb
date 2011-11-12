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
    def initialize(context, args, body)
      @context = context
      @args = args
      @body = body
    end

    def call(context, *args)
      call_context = Context.new(@context)
      @args.each_with_index do |arg, i|
        call_context.set(arg.to_sym, args[i].eval(context))
      end
      @body.eval(call_context)
    end

    def inspect
      "(fn (#{@args.map(&:name).join(", ")})\n #{@body.inspect})"
    end
  end
end

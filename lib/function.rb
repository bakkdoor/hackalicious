module Lisp
  class Function
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
end

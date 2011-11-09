module Lisp
  class Define
    def call(context, *args)
      value = args[1].eval(context)
      context.set(args[0].to_sym, value)
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
        puts parent
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

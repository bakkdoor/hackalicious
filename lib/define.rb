module Lisp
  class Define
    def call(context, *args)
      value = args[1].eval(context)
      context.set(args[0], value)
    end
  end
end

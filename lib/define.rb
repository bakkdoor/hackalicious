module Lisp
  class Define
    def call(context, *args)
      value = args[1].eval(context)
      context.set(args[0].name, value)
    end
  end
end

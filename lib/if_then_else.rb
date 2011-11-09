module Lisp
  class IfThenElse
    def call(context, *args)
      cond = args[0].eval(context)
      if cond
        args[1].eval(context)
      else
        args[2].eval(context)
      end
    end
  end
end

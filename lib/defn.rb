module Lisp
  class Defn
    def call(context, *args)
      name, *val = *args
      func = Fn.new.call(context, *val)
      context.set(name.to_sym, func)
    end
  end
end

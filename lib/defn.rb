module Lisp
  class Defn
    def call(context, *args)
      name, *val = *args
      func = Fn.new.call(context, *val)
      context.set(name.name, func)
    end
  end
end

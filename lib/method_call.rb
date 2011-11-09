module Lisp
  class MethodCall
    def call(context, *args)
      receiver, method_name, *args = args
      receiver = receiver.eval(context)
      method_name = method_name.to_sym
      args = args.map{ |a| a.eval(context) }

      receiver.send(method_name, *args)
    end
  end
end

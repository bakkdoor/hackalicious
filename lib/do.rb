module Lisp
  class Do
    def call(context, *args)
      val = nil
      args.each do |expr|
        val = expr.eval(context)
      end
      val
    end
  end
end

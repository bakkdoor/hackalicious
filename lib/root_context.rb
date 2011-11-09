module Lisp
  class RootContext < Context
    def initialize
      super(nil)
      setup_bindings
    end

    def setup_bindings
      @symbols = {
        :+ => BuiltinFunction.new { |first, *rest| rest.inject(first) { |acc, x| acc + x } },
        :"-" => BuiltinFunction.new { |first, *rest| rest.inject(first) { |acc, x| acc - x } },
        :* => BuiltinFunction.new { |first, *rest| rest.inject(first) { |acc, x| acc * x } },
        :/ => BuiltinFunction.new { |first, *rest| rest.inject(first) { |acc, x| acc / x } },
        :call => BuiltinFunction.new { |obj, *args| obj.send(*args) },
        :"." => MethodCall.new,
        :ruby_const => BuiltinFunction.new { |const| Kernel.const_get(const) },
        :def => Define.new,
        :def! => OuterDefine.new,
        :"def!!" => OuterDefine.new(2),
        :fn => Fn.new,
        :defn => Defn.new,
        :if => IfThenElse.new,
        :do => Do.new,
        :or => Proc.new { |context, *args|
          val = nil
          args.each do |a|
            val ||= a.eval(context)
          end
          val
        },
        :and => Proc.new { |context, *args|
          val = true
          args.each do |a|
            val &&= a.eval(context)
          end
          val
        },
        :nil => nil,
        :true => true,
        :false => false,
        :not => BuiltinFunction.new { |obj| !obj }
      }
    end
  end
end

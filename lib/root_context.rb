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
        :"=" => BuiltinFunction.new { |x, y| x == y },
        :call => BuiltinFunction.new { |obj, *args| obj.send(*args) },
        :"." => MethodCall.new,
        :ruby_const => BuiltinFunction.new { |const| Kernel.const_get(const) },
        :def => Define.new,
        :def! => OuterDefine.new,
        :"def!!" => OuterDefine.new(2),
        :fn => Fn.new,
        :defn => Defn.new,
        :first => BuiltinFunction.new { |list| list.first },
        :rest => BuiltinFunction.new { |list| list.rest },
        :empty? => BuiltinFunction.new { |list| list.empty? },
        :cons => BuiltinFunction.new { |item, list| list.unshift(item) },
        :if => IfThenElse.new,
        :do => Do.new
      }
    end
  end
end

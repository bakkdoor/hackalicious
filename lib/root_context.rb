module Lisp
  class RootContext < Context
    def initialize
      super(nil)
      setup_bindings
    end

    def setup_bindings
      @symbols = {
        :+ => BuiltinFunction.new { |x, y| x + y },
        :"-" => BuiltinFunction.new { |x,y| x - y },
        :* => BuiltinFunction.new { |x,y| x * y },
        :/ => BuiltinFunction.new { |x,y| x / y },
        :"=" => BuiltinFunction.new { |x, y| x == y },
        :call => BuiltinFunction.new { |obj, *args| obj.send(*args) },
        :"." => MethodCall.new,
        :ruby_const => BuiltinFunction.new { |const| Kernel.const_get(const) },
        :def => Define.new,
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

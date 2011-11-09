module Lisp
  class RootContext < Context
    def initialize
      super(nil)
      setup_bindings
    end

    def setup_bindings
      @symbols = {
        :print => BuiltinFunction.new { |x| print(x) },
        :println => BuiltinFunction.new { |x| puts(x) },
        :+ => BuiltinFunction.new { |x, y| puts(x); puts(y); x + y },
        :str => BuiltinFunction.new { |*args| args.inject(""){ |sum,val| sum + val.to_s } },
        :"-" => BuiltinFunction.new { |x,y| x - y },
        :* => BuiltinFunction.new { |x,y| x * y },
        :/ => BuiltinFunction.new { |x,y| x / y },
        :call => BuiltinFunction.new { |obj, *args| obj.send(*args) },
        :ruby_const => BuiltinFunction.new { |const| Kernel.const_get(const) },
        :def => Define.new,
        :fn => Fn.new,
        :defn => Defn.new,
        :first => BuiltinFunction.new { |list| list.first },
        :rest => BuiltinFunction.new { |list| list.rest },
        :empty? => BuiltinFunction.new { |list| list.empty? },
        :if => IfThenElse.new
      }
    end
  end
end

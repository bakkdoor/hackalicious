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
        :+ => BuiltinFunction.new { |*args| args.inject(0){ |sum,val| sum + val } },
        :str => BuiltinFunction.new { |*args| args.inject(""){ |sum,val| sum + val.to_s } },
        :"-" => BuiltinFunction.new { |x,y| x - y },
        :* => BuiltinFunction.new { |x,y| x * y },
        :/ => BuiltinFunction.new { |x,y| x / y },
        :def => Define.new,
        :fn => Fn.new
      }
    end
  end
end

module Lisp
  class RootContext
    def initialize
      super(nil)
      setup_bindings
    end

    def setup_bindings
      @symbols = {
        :print => Function.new { |x| print(x) },
        :println => Function.new { |x| puts(x) },
        :+ => Function.new { |x,y| puts(x + y) }
        :- => Function.new { |x,y| puts(x - y) },
        :* => Function.new { |x,y| puts(x * y) },
        :/ => Function.new { |x,y| puts(x / y) },
        :def => Define.new
      }
    end
  end
end

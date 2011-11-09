module Lisp
  class Context
    class SymbolNotFound < StandardError
      def initialize(symbol)
        super("Symbol not found: #{symbol}")
      end
    end

    def initialize(parent = nil)
      @parent = parent
      @symbols = {}
    end

    def get(symbol)
      if val = @symbols[symbol]
        return val
      end

      if @parent
        return @parent.get(symbol)
      end

      raise SymbolNotFound.new(symbol.name)
    end

    def has?(symbol)
      if @symbols[symbol]
        return true
      end

      if @parent
        return @parent.has?(symbol)
      end

      return false
    end

    def set(symbol, value)
      @symbols[symbol] = value
    end
  end
end

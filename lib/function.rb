module Lisp
  class FunctionArgs < Rubinius::AST::Node
    attr_accessor :args, :block

    def initialize(line, args)
      super(line)
      @args = args.map{|a| a.name.to_sym}
    end

    def bytecode(g)
      if @args.size > 1
        @args.each_with_index do |a, i|
          g.shift_array
          g.set_local i
          g.pop
        end
      else
        @args.each_with_index do |a, i|
          g.set_local i
        end
      end
    end

    def total_args
      @args.size
    end

    def required_args
      total_args
    end

    def create_locals(block)
      @args.each do |a|
        block.new_local(a)
      end
    end
  end

  class Function < Rubinius::AST::Iter
    def initialize(line, args, body)
      args = FunctionArgs.new(line, args.expressions)
      body = body || Rubinius::AST::NilLiteral.new(line)

      if body.empty?
        body.unshift_expression Rubinius::AST::NilLiteral.new(line)
      end

      super(line, args, body)
      args.create_locals(self)

      if args.total_args == 0
        @arguments.prelude = nil
      end
      if args.total_args > 1
        @arguments.prelude = :multi
      end
      @arguments.required_args = args.required_args
    end

    def bytecode(g)
      #docstring = body.shift_docstring
      super(g)
      #MethodDef.set_docstring(g, docstring, line, @args.args)
    end
  end

  def inspect
    "(fn (#{@args.map(&:name).join(", ")})\n #{@body.inspect})"
  end
end


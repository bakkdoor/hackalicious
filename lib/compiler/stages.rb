# Stages for compiling Lisp to Rubinius bytecode.

module Lisp
  class Compiler
    # Lisp AST -> Rubinius Symbolic bytecode
    class LispGenerator < Rubinius::Compiler::Stage
      stage :lisp_bytecode
      next_stage Rubinius::Compiler::Encoder

      attr_accessor :variable_scope

      def initialize(compiler, last)
        super
        @variable_scope = nil
        compiler.generator = self
      end

      def run
        @output = Rubinius::Generator.new
        @input.variable_scope = @variable_scope
        @input.bytecode @output
        @output.close
        run_next
      end

      def input(root_ast)
        @input = root_ast
      end
    end

    # Lisp string -> AST
    class LispCodeParser < Rubinius::Compiler::Stage
      stage :lisp_code
      next_stage LispGenerator

      def initialize(compiler, last)
        super
        compiler.parser = self
      end

      def root(root)
        @root = root
      end

      def print
        @print = true
      end

      def input(code, filename="(eval)", line=1)
        @input = code
        @filename = filename
        @line = line
      end

      def run
        ast = Parser.parse_string(@input, @line, @filename)
        @output = @root.new ast
        @output.file = @filename
        run_next
      end
    end

    # Lisp file -> AST
    class LispFileParser < Rubinius::Compiler::Stage
      stage :lisp_file
      next_stage LispGenerator

      def initialize(compiler, last)
        super
        compiler.parser = self
      end

      def root(root)
        @root = root
      end

      def print
        @print = true
      end

      def input(filename, line=1)
        @filename = filename
        @line = line
      end

      def run
        ast = Parser.parse_file(@filename, @line)
        # p ast if @print
        @output = @root.new ast
        @output.file = @filename
        run_next
      end
    end

  end
end

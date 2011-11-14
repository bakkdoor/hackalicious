module Lisp
  class Compiler < Rubinius::Compiler
    def self.lisp_compiled_name(file)
      if file.suffix? ".lisp"
        file + "c"
      else
        file + ".compiled.lisp"
      end
    end

    # Writes the compiled output file
    def self.compile_lisp_file(file, output = nil, line = 1, print = false)
      compiler = new :lisp_file, :compiled_file

      parser = compiler.parser
      parser.root Rubinius::AST::Script

      parser.input file, line

      if print
        parser.print
        printer = compiler.packager.print
        printer.bytecode = true
      end

      writer = compiler.writer
      writer.name = output ? output : lisp_compiled_name(file)

      begin
        compiler.run
      rescue Exception => e
        compiler_error "Error trying to compile lisp: #{file}", e
      end
    end

    # Returns a compiled method to be loaded by the rbx runtime.
    def self.compile_lisp_code(code, filename = "(eval)", line = 1, print = false)
      compiler = new :lisp_code, :compiled_method

      parser = compiler.parser
      parser.root Rubinius::AST::Script
      parser.input code, filename, line

      if print
        parser.print
        printer = compiler.packager.print
        printer.bytecode = true
      end

      begin
        compiler.run
      rescue Exception => e
        compiler_error "Error trying to compile lisp: #{filename}", e
      end
    end

    # Returns a compiled method to be evaled by the rbx runtime.
    def self.compile_lisp_eval(code, variable_scope, filename = "(eval)", line = 1, print = false)
      compiler = new :lisp_code, :compiled_method

      parser = compiler.parser
      parser.root Rubinius::AST::EvalExpression
      parser.input code, filename, line

      if print
        parser.print
        printer = compiler.packager.print
        printer.bytecode = true
      end

      compiler.generator.variable_scope = variable_scope

      begin
        compiler.run
      rescue Exception => e
        compiler_error "Error trying to compile lisp: #{filename}", e
      end
    end
  end

end

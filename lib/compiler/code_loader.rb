module Lisp
  class CodeLoader
    def self.load_file(source_file, verbose = false)
      compiled_file = Compiler.lisp_compiled_name(source_file)

      # optionally compile file if not yet compiled
      # or source file has been updated since last compilation
      if !File.exists?(Compiler.lisp_compiled_name(source_file)) ||
          File.stat(compiled_file).mtime < File.stat(source_file).mtime
        Compiler.compile_lisp_file(source_file, nil, 1, verbose)
      end

      cl = Rubinius::CodeLoader.new(compiled_file)
      begin
        cm = cl.load_compiled_file(compiled_file, 0)
      rescue ArgumentError
        cm = cl.load_compiled_file(compiled_file, 0, 0)
      end

      script = cm.create_script(false)
      script.file_path=(source_file)
      begin
        # @@file_stack.push(source_file)
        MAIN.__send__(:__script__)
      ensure
        # @@current_dir.pop()
        # @@file_stack.pop()
      end
    end
  end
end

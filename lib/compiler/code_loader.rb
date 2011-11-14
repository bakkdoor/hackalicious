module Lisp
  class CodeLoader
    def self.load_file(source_file)
      compiled_file = source_file + "c"
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

require "lib/parser/ast"

module Lisp
  class Parser
    def self.parse_file(filename)
      code = File.read(filename)
      parse_text(code)
    end

    def self.parse_text(text)
      p = Parser.new(text)
      p.parse
      p.result
    end
  end
end

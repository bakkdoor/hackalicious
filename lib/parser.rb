require "lib/parser/ast"

module Lisp
  class Parser
    def self.parse_file(filename)
      code = File.read(filename)
      p = Parser.new(code)
      p.parse
      p.result
    end
  end
end

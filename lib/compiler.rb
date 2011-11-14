#!/usr/bin/env rbx

base = File.dirname(__FILE__)
require base + '/compiler/compiler'
require base + '/compiler/stages'
require base + '/compiler/code_loader'

if __FILE__ == $0
  require base + '/compiler/command'
  Lisp::Compiler::Command.run ARGV
end

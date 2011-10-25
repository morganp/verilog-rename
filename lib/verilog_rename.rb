
libdir = File.dirname(__FILE__)
$LOAD_PATH.unshift(libdir) unless $LOAD_PATH.include?(libdir)

module VerilogRename
  VERSION = '0.1.0'
end

require 'verilog'

require 'verilog/rename'
require 'verilog/prefix'

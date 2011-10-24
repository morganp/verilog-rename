
libdir = File.dirname(__FILE__)
$LOAD_PATH.unshift(libdir) unless $LOAD_PATH.include?(libdir)

module VerilogRename
  VERSION = '0.0.2'
end

require 'verilog'

require 'verilog/rename'
require 'verilog/prefix'
require 'verilog/path_files'

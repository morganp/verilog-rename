require 'spec_helper'
require 'pp'

describe VerilogRename do

  it "Open file" do
    path = File.dirname( __FILE__ )

    #test_one = Verilog::File.new("test_one.v", {:path => File.join( path, 'fixtures') })
    #test_one.read_from_disk

    #test_three = Verilog::File.new("test_one.v", {:path => File.join( path, 'fixtures') })
    #test_three.read_from_disk
    
    #test_four = Verilog::File.new("test_one.v", {:path => File.join( path, 'fixtures') })
    #test_four.read_from_disk


    path_files = Verilog::PathFiles.new( File.join( path, 'fixtures') )
    path_files.read_all

    rename = Verilog::Rename.new('TEST_ONE', 'TEST_TWO', path_files)
    rename.rename_module

  end



end

require 'spec_helper'
require 'fileutils'
require 'pp'

describe VerilogRename do

  it "Open file" do
    path = File.dirname( __FILE__ )

    ## Git cant have empty folders, so create in test
    FileUtils.mkdir_p( ::File.join( path, 'scratch') )

    ## Clean Scratch Area
    FileUtils.rm( Dir.glob( ::File.join( path, 'scratch', '*.*') ) )

    ## Copy files from fixtures to scratch
    FileUtils.cp_r( ::File.join( path, 'fixtures'), ::File.join( path, 'scratch' ) )


    path_files = Verilog::PathFiles.new( File.join( path, 'scratch', 'fixtures') )
    path_files.read_all

    rename = Verilog::Rename.new('TEST_ONE', 'TEST_TWO', path_files)
    rename.rename_module

  end



end

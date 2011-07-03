verilog_rename
==============

Helpers to rename a verilog module and update refferences to it

Example (from the rename-verilog executable)

    require 'rubygems'
    require 'verilog_rename'

    this_dir = Dir.pwd
     
    path_files = Verilog::PathFiles.new( this_dir )
    path_files.read_all

    rename = Verilog::Rename.new('OLD_NAME', 'NEW_NAME', path_files)
    rename.rename_module

TODO
----

In the future the rename executable will have options for prefix which can operate on whole directories.

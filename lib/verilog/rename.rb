require 'FileUtils'

module Verilog

  class Rename
    attr_reader :path_files
    attr_reader :old_name, :new_name
    attr_reader :old_file, :new_file


    def initialize(old_name, new_name, path_files) 
      @old_name   = old_name
      @new_name   = new_name
      @path_files = path_files
    end

    def rename
      #Analyse file and rename module
      rename_module

      #update_refferences
    end

    def rename_module

      #find the correct file first
      file_to_rename = @path_files.find_by_module( @old_name )

      file_to_rename.contents.gsub!(/(^\s*module )#{@old_name}(\s+|;|\()/i, "\\1#{@new_name}\\2")
      
      extension = ::File.extname( file_to_rename.filename )
      
      #Need to change file name but keep extension
      file_to_rename.filename = @new_name + extension

      pp file_to_rename

      #Save file, will use new name.

      #Delete Old file

      #Update other files refferencing it.



    end

end


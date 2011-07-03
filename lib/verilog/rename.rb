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
      file_to_rename     = @path_files.find_by_module( @old_name )

      file_to_rename.contents.gsub!(/(^\s*module )#{@old_name}(\s+|;|\()/i, "\\1#{@new_name}\\2")
      
      extension                   = ::File.extname( file_to_rename.filename )
      absolute_original_file_name = file_to_rename.absolute_filename
      original_file_name          = file_to_rename.filename

      #Need to change file name but keep extension
      file_to_rename.filename = @new_name + extension

      #TODO Possibly check that that module name is not already in use
      #TODO check that the file name is not already used

      #Save file, will use new name.
      file_to_rename.save

      ## Delete Old file
      ::File.delete( absolute_original_file_name )

      ## Update other files including it.
      files_including_it = @path_files.includes_file( original_file_name )

      files_including_it.each do |file|
          file.contents.gsub!(/(^\s*`include [\'\"])#{ original_file_name }([\'\"])/, "\\1#{ file_to_rename.filename }\\2")
          #This could trigger many writes
          ## Verilog File needs a modified flag so files can be itereated and modified version can be saved.
          file.save
      end 

      ## Update files instatiating it.
      files_instantiating_it = @path_files.instantiates_module( @old_name )

      files_instantiating_it.each do |file|
          file.contents.gsub!(/(^\s*)#{ @old_name }(\s+)/,"\\1#{ @new_name }\\2")
          file.save
      end 

    end
  end
end


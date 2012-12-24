module Garaj
  class Project

    IGNORED_ENTRIES = %w{. .. .DS_Store .git} 

    attr_accessor :root_path

    # Initializes a new Garaj::Project object
    def initialize(root_path)
      @root_path = root_path.chomp('/')
    end

    # Returns name of the project
    def name
      @root_path.split('/').last
    end

    # Returns full path of the given relative path
    def full_path_to(relative_path)
      "#{@root_path}/#{relative_path.chomp('/')}"
    end

    # Checks if the given file is ignored
    def not_ignored?(entry)
      true unless IGNORED_ENTRIES.include?(entry)
    end

    # Checks if the given path is a directory
    def path_is_dir?(relative_path)
      true if File.directory?(full_path_to(relative_path))
    end

    # Returns the name of the file 
    def file_name_at(relative_path)
      relative_path.split('/').last
    end

    # Returns the contents of the file at the given path
    def file_content_at(relative_path)
      File.read(full_path_to(relative_path))
    end

    # Returns a list of the files at the given path
    def files_at(relative_path)
      files = []
      Dir.foreach(full_path_to(relative_path)) do |entry|
        if !File.directory?("#{full_path_to(relative_path)}/#{entry}") and not_ignored?(entry)
          files << entry 
        end
      end
      files
    end

    # Returns a list of the dirs at the given path
    def dirs_at(relative_path)
      dirs = []
      Dir.foreach(full_path_to(relative_path)) do |entry|
        if File.directory?("#{full_path_to(relative_path)}/#{entry}") and not_ignored?(entry)
          dirs << entry 
        end
      end
      dirs
    end
  end
end

require 'sinatra/base'

module Garaj
  class Web < Sinatra::Base

    configure do 
      set :port, '9988' 
      set :logging, false 
      set :dump_errors, false
      set :public_folder, File.expand_path('../web/public', __FILE__)
      set :views, File.expand_path('../web/views', __FILE__)
    end

    helpers do
      # Returns the url for the given relative path
      def url_for(entry, relative_path)
        if !relative_path.empty?
          "/#{relative_path}/#{entry}" 
        else
          "/#{entry}" 
        end
      end
    end

    def self.start(project_root)
      set :project, Garaj::Project.new(project_root)
      run!
    end

    get '/*?' do |relative_path|
      @project_name = settings.project.name
      @current_path = relative_path
   
      if settings.project.path_is_dir?(relative_path)
        @dirs = settings.project.dirs_at(relative_path)
        @files = settings.project.files_at(relative_path)
        erb :dir
      else
        @file_name = settings.project.file_name_at(relative_path)
        @file_content = settings.project.file_content_at(relative_path)
        erb :file
      end
    end

  end
end

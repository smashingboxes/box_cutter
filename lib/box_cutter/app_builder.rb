module BoxCutter
  class AppBuilder < Rails::AppBuilder
    def readme
      template 'README.md.erb', 'README.md'
    end

    def gitignore
      remove_file '.gitignore'
      copy_file 'boxcutter_gitignore', '.gitignore'
    end

    # def set_ruby_to_version_being_used
    #   create_file '.ruby-version', "#{BoxCutter::RUBY_VERSION}\n"
    # end
  end
end

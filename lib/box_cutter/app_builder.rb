module BoxCutter
  class AppBuilder < Rails::AppBuilder
    def readme
      template 'README.md.erb', 'README.md'
    end

    def gitignore
      template 'boxcutter_gitignore', '.gitignore'
    end

    def gemfile
      template 'Gemfile.erb', 'Gemfile'
    end

    def use_postgres_config_template
      template 'database.yml.erb', 'config/database.yml', force: true
      template 'database.yml.erb', 'config/database.example.yml', force: true
    end

    def create_database
      bundle_command 'exec rake db:create db:migrate'
    end

    # def set_ruby_to_version_being_used
    #   create_file '.ruby-version', "#{BoxCutter::RUBY_VERSION}\n"
    # end
  end
end

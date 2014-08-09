module BoxCutter
  class AppGenerator < Rails::Generators::AppGenerator
    class_option :database, :type => :string, :aliases => '-d', :default => 'postgresql',
      :desc => "Preconfigure for selected database (options: #{DATABASES.join('/')})"

    class_option :skip_test_unit, :type => :boolean, :aliases => '-T', :default => true,
      :desc => 'Skip Test::Unit files'

    def finish_template
      invoke :box_cutter_customization
      super
    end

    def cut_dev_environment
      invoke :cut_database
    end

    def cut_database
      say 'Setting up database'

      if 'postgresql' == options[:database]
        build :use_postgres_config_template
      end

      build :create_database
    end

    def box_cutter_customization
      # build :set_ruby_to_version_being_used
    end

    protected

    def get_builder_class
      BoxCutter::AppBuilder
    end
  end
end

require 'rails/generators'
require 'rails/generators/rails/app/app_generator'

module BoxCutter
  class AppGenerator < Rails::Generators::AppGenerator
    def finish_template
      invoke :box_cutter_customization
      super
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

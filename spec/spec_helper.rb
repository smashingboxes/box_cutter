require 'pry'
require 'bundler/setup'

Bundler.require(:default, :test)

require (Pathname.new(__FILE__).dirname + '../lib/box_cutter').expand_path

Dir['./spec/support/**/*.rb'].each { |file| require file }


RSpec.configure do |config|
  config.include BoxCutterTestHelpers

  config.before(:all) do
    ENV['DISABLE_SPRING'] = 'true'
    remove_project_directory
    create_tmp_directory
    cut_the_box
  end

  config.before(:each) do
    ENV['DISABLE_SPRING'] = 'true'
    drop_dummy_database
  end

  config.after(:all) do
    remove_project_directory
  end
end

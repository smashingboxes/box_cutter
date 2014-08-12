require 'spec_helper'

describe 'Box cut a new project with default configuration' do
  it 'generated README.md contains project name' do
    readme_file = IO.read("#{project_path}/README.md")

    expect(readme_file).to match(/Dummy/)
  end

  it 'generates a .gitignore for rails' do
    actual   = IO.read("#{project_path}/.gitignore")
    expected = IO.read("templates/boxcutter_gitignore")
    expect(actual).to eq(expected)
  end

  it 'generates the Rails Gemfile' do
    gemfile = IO.read("#{project_path}/Gemfile")

    expect(gemfile).to match(/rails/)
    expect(gemfile).to match(/pg/)
    expect(gemfile).to match(/sass-rails/)
    expect(gemfile).to match(/uglifier/)
  end

  it 'sets up travis.yml' do
    travis_yml = IO.read("#{project_path}/.travis.yml")

    expect(travis_yml).to match(/psql/)
  end

  describe 'database' do
    it 'creates the database config' do
      expect(File.file?("#{project_path}/config/database.yml")).to eq(true)
      expect(File.file?("#{project_path}/config/database.example.yml")).to eq(true)

      database_yml = IO.read("#{project_path}/config/database.yml")

      expect(database_yml).to match(/dummy_development/)
      expect(database_yml).to match(/dummy_test/)
    end
  end
end

require 'spec_helper'

describe 'Box cut a new project with default configuration' do
  it 'generated README.md contains project name' do
    cut_the_box

    readme_file = IO.read("#{project_path}/README.md")

    expect(readme_file).to match(/Dummy/)
  end
end

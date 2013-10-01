require 'rake'

shared_context 'rake' do
  let(:engine_path)   { SpreeSubscribe::Engine.root }
  let(:rake)          { Rake::Application.new }
  let(:task_name)     { self.class.top_level_description }
  let(:task_path)     { "lib/tasks/#{task_name.split(":").first}" }
  subject             { rake[task_name] }

  def loaded_files_excluding_current_rake_file
    $".reject {|file| file == engine_path.join("#{task_path}.rake").to_s }
  end

  before do
    Rake.application = rake
    Rake.application.rake_require(task_path, [engine_path.to_s], loaded_files_excluding_current_rake_file)

    Rake::Task.define_task(:environment)
  end
end

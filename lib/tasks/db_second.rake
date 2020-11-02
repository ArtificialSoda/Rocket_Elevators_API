# lib/tasks/db_second.rake

task spec: ['second:db:test:prepare']

namespace :second do
  namespace :db do |ns|
    %i(drop create setup migrate rollback seed version).each do |task_name|
      task task_name do
        Rake::Task["db:#{task_name}"].invoke
      end
    end

    namespace :schema do
      %i(load dump).each do |task_name|
        task task_name do
          Rake::Task["db:schema:#{task_name}"].invoke
        end
      end
    end

    namespace :test do
      task :prepare do
        Rake::Task['db:test:prepare'].invoke
      end
    end

    # append and prepend proper tasks to all the tasks defined here above
    ns.tasks.each do |task|
      task.enhance ['second:set_custom_config'] do
        Rake::Task['second:revert_to_original_config'].invoke
      end
    end
  end

  task :set_custom_config do
    # save current vars
    @original_config = {
      env_schema: ENV['SCHEMA'],
      config: Rails.application.config.dup
    }

    # set config variables for custom database
    ENV['SCHEMA'] = 'db_second/schema.rb'
    Rails.application.config.paths['db'] = ['db_second']
    Rails.application.config.paths['db/migrate'] = ['db_second/migrate']
    # If you are using Rails 5 or higher change `paths['db/seeds']` to `paths['db/seeds.rb']`
    Rails.application.config.paths['db/seeds.rb'] = ['db_second/seeds.rb']
    Rails.application.config.paths['config/database'] = ['config/database_second.yml']
  end

  task :revert_to_original_config do
    # reset config variables to original values
    ENV['SCHEMA'] = @original_config[:env_schema]
    Rails.application.config = @original_config[:config]
  end
end

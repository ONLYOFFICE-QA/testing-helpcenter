# frozen_string_literal: true

require 'wrata_api'

helpcenter_wrata_user = 'helpcenter'

namespace(:wrata) do
  desc 'Check that correct user trying to run tests'
  task :ensure_user do
    api = WrataApi::WrataApi.new
    current_user = api.profile['login']
    next if current_user == helpcenter_wrata_user

    raise("You're trying to run wrata tests with #{current_user} instead of #{helpcenter_wrata_user}")
  end

  desc 'Turn on servers on Wrata'
  task :wrata_turn_on_servers, [:count] do |_, args|
    api = WrataApi::WrataApi.new
    free_pcs = api.free_servers(args[:count])
    free_pcs.power_on('1gb')
    sleep(60) # timeout to correctly turn on of all services
    free_pcs.book
  end

  desc 'Add tests to queue'
  task :add_tests_to_queue, [:location, :path] do |_, args|
    location = args[:location] || 'default'
    api = WrataApi::WrataApi.new
    all_files = api.file_list('ONLYOFFICE-QA/testing-helpcenter')
    test_files = all_files.select { |spec| spec.start_with?(args[:path]) }
    test_files.each do |test|
      api.add_to_queue("~/RubymineProjects/testing-helpcenter/#{test}",
                       location: location,
                       branch: 'master')
    end
  end

  desc 'Run test after help center update'
  task :run_help_center_tests, [:location] => :ensure_user do |_, args|
    location = args[:location] || 'default'
    Rake::Task['wrata:wrata_turn_on_servers'].execute(count: 1)
    Rake::Task['wrata:add_tests_to_queue'].execute(location: location, path: 'spec/functional')
    puts('One test node is setup. Please check that test are run fine on it')
  end
end

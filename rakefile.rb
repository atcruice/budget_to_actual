require "minitest/test_task"
require "standard/rake"

Minitest::TestTask.create do |test_task|
  test_task.test_prelude = 'require "bundler/setup"'
  test_task.warning = false
end

task default: %i[test standard]

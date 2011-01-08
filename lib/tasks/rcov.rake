require 'cucumber/rake/task'
require 'spec/rake/spectask'
 
namespace :rcov do
  Cucumber::Rake::Task.new(:cucumber) do |t|  
    system "mkdir tmp/features -p"  
    t.rcov = true
    t.cucumber_opts = %w{-f html -o tmp/features/index.htm -f progress}
    t.rcov_opts = %w{--rails --no-html --exclude osx\/objc,gems\/,spec\/,features\/ --aggregate coverage.data}
    t.rcov_opts << %[-o "coverage"]
  end
 
  Spec::Rake::SpecTask.new(:rspec) do |t|
    t.spec_opts = ['--options', "\"#{RAILS_ROOT}/spec/spec.opts\""]
    t.spec_files = FileList['spec/**/*_spec.rb']
    t.rcov = true
    t.rcov_opts = lambda do
      IO.readlines("#{RAILS_ROOT}/spec/rcov.opts").map {|l| l.chomp.split " "}.flatten
    end
  end
 
  desc "Run both specs and features to generate aggregated coverage"
  task :all do |t|
    rm "coverage.data" if File.exist?("coverage.data")
    Rake::Task["rcov:cucumber"].invoke
    Rake::Task["rcov:rspec"].invoke
  end

  desc "Remove coverage.data"
  task :remove_coverage do |t|
    rm "coverage.data" if File.exist?("coverage.data")
  end

  desc "Run only cucumber"
  task :only_cucumber do |t|
    Rake::Task["rcov:cucumber"].invoke
  end

  desc "Run only rspec"
  task :only_rspec do |t|
    Rake::Task["rcov:rspec"].invoke
  end
end

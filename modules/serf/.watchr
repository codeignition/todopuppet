watch('spec/(.*)/(.*_spec)\.rb') {|file| system("bundle exec rake spec") }

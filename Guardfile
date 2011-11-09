guard 'bundler' do
  watch('Gemfile')
  # Uncomment next line if Gemfile contain `gemspec' command
  # watch(/^.+\.gemspec/)
end

guard 'spork', :rspec_env => { 'RAILS_ENV' => 'test' }, :cucumber => false, :wait => 40 do
  watch('Gemfile')
  watch('Gemfile.lock')
  watch('spec/spec_helper.rb')
  watch('Guardfile')
end

guard 'rspec', :cli => "--drb --color", :version => 2, :rvm => ['1.9.3'] do
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^lib/(.+)\.rb$})                           { |m| "spec/#{m[1]}_spec.rb" }
  watch('spec/spec_helper.rb')                        { "spec" }
end

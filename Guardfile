guard 'rspec', :cli => "--color --order random", :version => 2 do
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^lib/(.+)\.rb$})                           { |m| "spec/#{m[1]}_spec.rb" }
  watch('spec/spec_helper.rb')                        { "spec" }
end

guard 'rspec', cli: "--color --format Fuubar" do
  watch(%r{^lib/(.+)\.rb}) { |m| "spec/#{m[1]}_spec.rb" }
  watch('lib/javascript_object_notation.treetop') { |m| "spec/json_parser_spec.rb" }
  watch(%r{^spec/.+_spec\.rb})
  watch('spec/spec_helper.rb') { "spec" }
end

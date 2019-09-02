# frozen_string_literal: true

%w[version exceptions base].each do |name|
  require "lite/query/#{name}"
end

require 'generators/lite/query/install_generator'

%w[rails rspec test_unit].each do |name|
  require "generators/#{name}/query_generator"
end

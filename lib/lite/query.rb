# frozen_string_literal: true

require 'generators/rails/query_generator' if defined?(Rails::Generators)

%w[version exceptions base].each do |name|
  require "lite/query/#{name}"
end

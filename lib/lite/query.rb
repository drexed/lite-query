# frozen_string_literal: true

%w[version exceptions base].each do |name|
  require "lite/query/#{name}"
end

require 'generators/lite/query/install_generator'
require 'generators/rails/query_generator'

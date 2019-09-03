# frozen_string_literal: true

require 'rails/generators'

module Rspec
  module Generators
    class QueryGenerator < Rails::Generators::NamedBase

      source_root File.expand_path('../templates', __FILE__)

      def create_test_file
        path = File.join('spec', 'queries', class_path, "#{file_name}_query_spec.rb")
        empty_directory('spec/queries')
        template('query_spec.rb.tt', path)
      end

      private

      def file_name
        @_file_name ||= remove_possible_suffix(super)
      end

      def remove_possible_suffix(name)
        name.sub(/_?query$/i, '')
      end

    end
  end
end

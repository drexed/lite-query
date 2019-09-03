# frozen_string_literal: true

require 'rails/generators'

module TestUnit
  module Generators
    class QueryGenerator < Rails::Generators::NamedBase

      source_root File.expand_path('../templates', __FILE__)
      check_class_collision suffix: 'QueryTest'

      def create_test_file
        path = File.join('test', 'queries', class_path, "#{file_name}_query_test.rb")
        empty_directory('test/queries')
        template('query_test.rb.tt', path)
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

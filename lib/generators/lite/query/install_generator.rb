# frozen_string_literal: true

require 'rails/generators'

module Lite
  module Query
    class InstallGenerator < Rails::Generators::Base

      source_root File.expand_path('../templates', __FILE__)

      def copy_application_query_file
        copy_file('install.rb', 'app/queries/application_query.rb')
      end

    end
  end
end
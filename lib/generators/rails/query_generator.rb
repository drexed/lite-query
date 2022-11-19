# frozen_string_literal: true

module Rails
  class QueryGenerator < Rails::Generators::NamedBase

    source_root File.expand_path("../templates", __FILE__)
    check_class_collision suffix: "Query"

    def copy_files
      path = File.join("app", "queries", class_path, "#{file_name}_query.rb")
      template("query.rb.tt", path)
    end

    private

    def file_name
      @_file_name ||= remove_possible_suffix(super)
    end

    def remove_possible_suffix(name)
      name.sub(/_?query$/i, "")
    end

  end
end

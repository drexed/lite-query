# frozen_string_literal: true

require "spec_helper"

RSpec.describe Rails::QueryGenerator, type: :generator do
  destination(File.expand_path("../../tmp", __FILE__))

  before do
    prepare_destination
    run_generator(%w[v1/users/age])
  end

  let(:query_path) { "spec/generators/tmp/app/queries/v1/users/age_query.rb" }

  describe "#generator" do
    context "when generating app files" do
      it "to be true when query file exists" do
        expect(File.exist?(query_path)).to be(true)
      end

      it "to include the proper markup" do
        query_file = File.read(query_path)
        text_snippet = "class V1::Users::AgeQuery < Lite::Query::Base"

        expect(query_file.include?(text_snippet)).to be(true)
      end
    end
  end

end

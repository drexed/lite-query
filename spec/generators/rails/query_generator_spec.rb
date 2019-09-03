# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Rails::QueryGenerator, type: :generator do
  destination(File.expand_path('../../tmp', __FILE__))

  before do
    prepare_destination
    run_generator(%w[v1/users/age])
  end

  let(:query_path) { 'spec/generators/tmp/app/queries/v1/users/age_query.rb' }
  let(:rspec_path) { 'spec/generators/tmp/spec/queries/v1/users/age_query_spec.rb' }

  describe '#generator' do
    context 'when generating app files' do
      it 'to be true when query file exists' do
        expect(File.exist?(query_path)).to eq(true)
      end

      it 'to include the proper markup' do
        query_file = File.read(query_path)
        text_snippet = 'class V1::Users::AgeQuery < ApplicationQuery'

        expect(query_file.include?(text_snippet)).to eq(true)
      end
    end

    context 'when generating spec files' do
      it 'to be true when query file exists' do
        expect(File.exist?(rspec_path)).to eq(true)
      end

      it 'to include the proper markup' do
        rspec_file = File.read(rspec_path)
        text_snippet = 'V1::Users::AgeQuery, type: :query'

        expect(rspec_file.include?(text_snippet)).to eq(true)
      end
    end
  end

end

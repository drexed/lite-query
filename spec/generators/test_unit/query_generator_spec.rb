# frozen_string_literal: true

require 'spec_helper'

RSpec.describe TestUnit::Generators::QueryGenerator, type: :generator do
  destination(File.expand_path('../../tmp', __FILE__))

  before do
    prepare_destination
    run_generator(%w[v1/users/age])
  end

  let(:sample_path) { 'spec/generators/tmp/test/queries/v1/users/age_query_test.rb' }

  describe '#generator' do
    it 'to be true when sample file exists' do
      expect(File.exist?(sample_path)).to eq(true)
    end

    it 'to include the proper markup' do
      sample_file = File.read(sample_path)

      expect(sample_file.include?('ActiveSupport::TestCase')).to eq(true)
    end
  end

end

# frozen_string_literal: true

RSpec.describe Lite::Query do
  it "to be a version number" do
    expect(Lite::Query::VERSION).not_to be_nil
  end
end

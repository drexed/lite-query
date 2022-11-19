# frozen_string_literal: true

require "spec_helper"

class NoExecuteQuery < Lite::Query::Base; end

class OlderThanAgeQuery < Lite::Query::Base

  def call
    return relation unless args[:age]

    relation.where("age > ?", args[:age])
  end

end

RSpec.describe Lite::Query::Base do
  let(:scope) { User.all }

  describe ".call" do
    it "to be an Lite::Query::NotImplementedError error" do
      query = NoExecuteQuery.new(scope)

      expect { query.call }.to raise_error(NotImplementedError)
    end
  end

  describe ".execute" do
    it "to be default_relation SQL string" do
      query = OlderThanAgeQuery.new(scope)
      sql = 'SELECT "users".* FROM "users"'

      expect(query.execute.to_sql).to eq(sql)
    end

    it "to be custom relation SQL string" do
      query = OlderThanAgeQuery.new(scope.limit(1))
      sql = 'SELECT "users".* FROM "users" LIMIT 1'

      expect(query.execute.to_sql).to eq(sql)
    end

    it "to be scoped SQL string" do
      query = OlderThanAgeQuery.new(scope, age: 10)
      sql = 'SELECT "users".* FROM "users" WHERE (age > 10)'

      expect(query.execute.to_sql).to eq(sql)
    end
  end

end

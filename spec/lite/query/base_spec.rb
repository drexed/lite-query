# frozen_string_literal: true

require 'spec_helper'

class NoExecuteQuery < Lite::Query::Base

  def default_relation
    User.all
  end

end

class OlderThanAgeQuery < Lite::Query::Base

  def execute
    return relation unless args[:age]

    relation.where('age > ?', args[:age])
  end

  private

  def default_relation
    User.all
  end

end

RSpec.describe Lite::Query::Base do

  describe '.call' do
    it 'to be an Lite::Query::NotImplementedError error' do
      query = NoExecuteQuery.new

      expect { query.call }.to raise_error(Lite::Query::NotImplementedError)
    end
  end

  describe '.execute' do
    it 'to be default_relation SQL string' do
      query = OlderThanAgeQuery.new
      sql = 'SELECT "users".* FROM "users"'

      expect(query.execute.to_sql).to eq(sql)
    end

    it 'to be custom relation SQL string' do
      query = OlderThanAgeQuery.new(User.limit(1))
      sql = 'SELECT "users".* FROM "users" LIMIT 1'

      expect(query.execute.to_sql).to eq(sql)
    end

    it 'to be scoped SQL string' do
      query = OlderThanAgeQuery.new(nil, age: 10)
      sql = 'SELECT "users".* FROM "users" WHERE (age > 10)'

      expect(query.execute.to_sql).to eq(sql)
    end
  end

end

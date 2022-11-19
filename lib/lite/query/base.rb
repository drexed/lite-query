# frozen_string_literal: true

module Lite
  module Query
    class Base

      attr_accessor :relation
      attr_reader :args

      def initialize(relation = nil, args = {})
        @relation = relation
        @args = args
      end

      class << self

        def call(relation = nil, args = {})
          klass = new(relation, args)
          klass.call
        end

      end

      def call
        raise NotImplementedError
      end

    end
  end
end

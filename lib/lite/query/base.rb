# frozen_string_literal: true

module Lite
  module Query
    class Base

      attr_accessor :relation
      attr_reader :args

      class << self

        def call(relation = nil, **args)
          klass = new(relation, args)
          klass.call
        end

      end

      def initialize(relation = nil, **args)
        @relation = relation || default_relation
        @args = args
      end

      def call
        raise Lite::Query::NotImplementedError unless defined?(execute)

        execute
      end

      private

      def default_relation
        nil
      end

    end
  end
end

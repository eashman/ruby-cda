require 'active_support/core_ext/class/attribute'
require 'active_support/concern'

module Cda
  module Constraints
    extend ActiveSupport::Concern

    included do
      class_attribute :constraints, instance_writer: false

      self.constraints = {}
    end

    def defaults
      self.class.defaults
    end

    module ClassMethods
      def add_constraint(name, opts = {})
        current_constraint = self.constraints[name]
        if current_constraint
          unless current_constraint == opts.slice(*current_constraint.keys)
            raise RuntimeError, "Duplicate constraint: #{self.name}##{name} #{opts.inspect}"
          end
        end
        self.constraints = self.constraints.merge(name => opts)
      end

      def defaults
        @defaults ||= self.constraints.reduce({}) do |acc, (path, opts)|
          if opts[:value].present? && opts[:cardinality] == '1..1'
            Cda::Utility.merge_json(acc, Utility.inference(path.split('.'), opts[:value], self))
          else
            acc
          end
        end
      end
    end
  end
end
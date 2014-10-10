%w(experiment_variant identity).each do |f|
  require_relative "mongoid_adapter/#{f}"
end

module Divisio
  module MongoidAdapter

    def self.split(experiment_name, variants, identity)
      variants = Array(variants).map(&:to_s)
      identity_object = Identity.find_or_create_by(value: identity)
      experiment_scope = identity_object.experiments.where(experiment_name: experiment_name)
      return experiment_scope.first.assigned_variant if experiment_scope.any?

      variant_for_identity = assign_variant(experiment_name, variants, identity)
      experiment = ExperimentVariant.new(experiment_name: experiment_name, assigned_variant: variant_for_identity)
      identity_object.experiments << experiment

      return variant_for_identity if identity_object.save
      raise "Experiment #{experiment_name} with variant #{variant_for_identity} failed to save for identity #{identity}"
    end

    def self.delete_experiment_for_identity(identity, experiment_name, options = {})
      identity_object = Identity.where(value: identity).first

      if identity_object
        experiment = identity_object.experiments.where(experiment_name: experiment_name).first
        return experiment.destroy if experiment
      end

      return true
    end

    private
    # not really private

    def self.assign_variant(experiment_name, variants, identity)
      ModuloAlgorithm.new(experiment_name+identity.to_s, variants).calc
    end

  end
end

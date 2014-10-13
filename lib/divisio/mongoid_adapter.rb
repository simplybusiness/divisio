%w(experiment).each do |f|
  require_relative "mongoid_adapter/#{f}"
end

module Divisio
  module MongoidAdapter

    def self.split(experiment_name, variants, identity)
      variants = Array(variants).map(&:to_s)
      experiment_object = Experiment.where(identity: identity, name: experiment_name).first
      return experiment_object.assigned_variant if experiment_object

      variant_for_identity = assign_variant(experiment_name, variants, identity)
      experiment_object = Experiment.new(identity: identity, name: experiment_name, variant: variant_for_identity)

      return variant_for_identity if experiment_object.save
      raise "Experiment #{experiment_name} with variant #{variant_for_identity} failed to save for identity #{identity}"
    end

    def self.delete_experiment_for_identity(identity, experiment_name)
      experiment_object = Experiment.where(identity: identity, name: experiment_name).first

      return experiment_object.destroy if experiment_object
      return false
    end

    private
    # not really private

    def self.assign_variant(experiment_name, variants, identity)
      ModuloAlgorithm.new(experiment_name+identity.to_s, variants).calc
    end

  end
end

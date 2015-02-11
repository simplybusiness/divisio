%w(experiment).each do |f|
  require_relative "mongoid_adapter/#{f}"
end

class Divisio
  module MongoidAdapter
    include ModuloAdapter
    extend self

    def split(experiment_name, variants, identity)
      experiment_object = Experiment.where(identifier: identity, name: experiment_name).first
      return experiment_object.variant if experiment_object

      variant_for_identity = super.to_s
      experiment_object = Experiment.new(identifier: identity, name: experiment_name, variant: variant_for_identity)

      return variant_for_identity if experiment_object.save
    rescue Moped::Errors::OperationFailure
      split(experiment_name, variants, identity)
    end

    def delete_experiment_for_identity(identity, experiment_name)
      experiment_object = Experiment.where(identifier: identity, name: experiment_name).first

      return experiment_object.destroy if experiment_object
      return false
    end
  end
end

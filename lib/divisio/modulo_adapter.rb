class Divisio
  module ModuloAdapter
    extend self

    def split(experiment_name, variants, identity)
      ModuloAlgorithm.new(experiment_name+identity.to_s, variants).calc
    end

    def delete_experiment_for_identity(identity, experiment_name)
      raise NotImplementedError
    end
  end
end

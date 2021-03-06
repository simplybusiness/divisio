# frozen_string_literal: true

class Divisio
  module BaseAdapter
    extend self

    def split(experiment_name, variants, identity)
      ModuloAlgorithm.new(experiment_name.to_s + identity.to_s, variants).calc
    end

    def delete_experiment_for_identity(_identity, _experiment_name)
      raise NotImplementedError
    end
  end
end

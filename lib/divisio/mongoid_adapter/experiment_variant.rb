module Divisio
  module MongoidAdapter
    class ExperimentVariant

      include Mongoid::Document
      include Mongoid::Timestamps

      embedded_in :identity

      field :experiment_name, type: String
      field :assigned_variant, type: String

      validates_presence_of :experiment_name, :assigned_variant

    end
  end
end

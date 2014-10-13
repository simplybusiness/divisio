module Divisio
  module MongoidAdapter
    class Experiment

      include Mongoid::Document
      include Mongoid::Timestamps

      field :experiment_name, type: String
      field :identity, type: String
      field :assigned_variant, type: String

      validates_presence_of :experiment_name, :assigned_variant, :identity

    end
  end
end

module Divisio
  module MongoidAdapter
    class Experiment

      include Mongoid::Document
      include Mongoid::Timestamps

      field :name, type: String
      field :identity, type: String
      field :variant, type: String

      validates_presence_of :name, :variant, :identity

      index({ name: 1, identity: 1}, { uniq: true})

    end
  end
end

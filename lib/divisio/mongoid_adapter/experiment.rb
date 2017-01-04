class Divisio
  module MongoidAdapter
    class Experiment
      include Mongoid::Document
      include Mongoid::Timestamps

      validates_presence_of :name, :variant, :identifier
      validates_uniqueness_of :identifier, scope: :name

      field :name, type: String
      field :identifier, type: String
      field :variant, type: String

      index({ name: 1, identifier: 1 }, unique: true)
    end
  end
end

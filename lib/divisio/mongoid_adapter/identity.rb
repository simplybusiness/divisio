module Divisio
  module MongoidAdapter
    class Identity

      include Mongoid::Document
      include Mongoid::Timestamps

      embeds_many :experiments, class_name: 'Divisio::MongoidAdapter::ExperimentVariant', inverse_of: :identity, validate: false, cascade_callbacks: true

      field :value, type: String

      validates_presence_of :value

    end
  end
end

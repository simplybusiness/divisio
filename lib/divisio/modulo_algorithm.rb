# frozen_string_literal: true

class Divisio
  class ModuloAlgorithm
    attr_reader :key, :variants
    private :key, :variants

    def initialize(key, variants)
      @key      = key.to_s
      @variants = variants_as_array(variants)
    end

    def calc
      number_of_variants = variants.size
      position           = Digest::MD5.hexdigest(key).to_i(16) % number_of_variants

      variants[position]
    end

    private

    def variants_as_array(variants)
      return Array(variants) unless variants.is_a? Hash

      flattened_variants = []
      variants.each_pair do |name, weight|
        weight.times { flattened_variants << name }
      end
      flattened_variants
    end
  end
end

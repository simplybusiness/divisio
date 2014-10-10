module Divisio
  class ModuloAlgorithm
    attr_reader :key
    private :key

    attr_reader :variants
    private :variants

    def initialize(key, variants)
      @key = key
      @variants = variants
    end

    def calc
      number_of_variants = Array(variants).size
      position = Digest::MD5.hexdigest(key).to_i(16) % number_of_variants

      variants[position]
    end
  end
end

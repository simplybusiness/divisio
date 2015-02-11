class Divisio
  class ModuloAlgorithm

    attr_reader :key, :variants
    private :key, :variants

    def initialize(key, variants)
      @key      = key
      @variants = Array(variants)
    end

    def calc
      number_of_variants = variants.size
      position           = Digest::MD5.hexdigest(key).to_i(16) % number_of_variants

      variants[position]
    end

  end
end

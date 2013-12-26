  class Luhn
    def self.valid?(value, mod)
      self.checksum(value, :odd) % mod == 0
    end

    def self.control_digit(value, mod)
      sum = self.checksum(value, :even)
      (sum % mod != 0) ? mod - (sum % mod) : 0
    end

    def self.generate(size, options = {})
      generated = options[:prefix] || ''
      (size - generated.size - 1).times { |i| generated += rand(10).to_s }
      generated + self.control_digit(generated, options[:mod]).to_s
    end

  protected

    def self.checksum(value, operation)
      i = 0
      compare_method = (operation == :even) ? :== : :>
      value.reverse.split('').inject(0) do |sum, c|
        n = c.to_i
        weight = (i % 2).send(compare_method, 0) ? n * 2 : n
        i += 1
        sum += weight < 10 ? weight : weight - 9
      end
    end
  end

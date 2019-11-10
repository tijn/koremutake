require "string_scanner"

# TODO: Write documentation for `Koremutake`
class Koremutake
  VERSION = "0.1.0"

  VOWELS   = %w[A E I O U Y]
  PREFIXES = %w[B D F G H J K L M N P R S T V BR DR FR GR PR ST TR]
  PHONEMES = PREFIXES.flat_map do |prefix|
    VOWELS.map { |vowel| "#{prefix}#{vowel}" }
  end

  @integer : UInt64

  def initialize(integer : UInt8 | UInt16 | UInt32 | UInt64 | Int8 | Int16 | Int32 | Int64)
    @integer = integer.to_u64
  end

  def self.for(object : Object)
    new(object.object_id)
  end

  def self.encode(integer)
    new(integer).to_s
  end

  def self.decode(string : String)
    scanner = StringScanner.new string.upcase
    number = 0.to_u64
    while !scanner.eos?
      if index = PHONEMES.index scanner.peek(2)
        number = number * 128 + index
        scanner.offset += 2
      elsif index = PHONEMES.index scanner.peek(3)
        number = number * 128 + index
        scanner.offset += 3
      else
        raise ArgumentError.new("#{string} is not koremutake")
      end
    end
    number
  end

  def self.parse(string : String)
    new(decode(string))
  end

  def to_i
    @integer
  end

  def to_s(io)
    io << to_a.map { |index| PHONEMES[index] }.join.capitalize
  end

  def to_a
    number = to_i
    return [0] if number == 0
    array = [] of UInt8
    while number > 0
      number, modulus = number.divmod(128)
      array.unshift modulus.to_u8
    end
    array
  end
end

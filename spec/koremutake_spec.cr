require "./spec_helper"

describe Koremutake do
  it "enocodes 0" do
    Koremutake.encode(0).should eq("Ba")
  end

  it "enocodes 1" do
    Koremutake.encode(1).should eq("Be")
  end

  it "enocodes 2" do
    Koremutake.encode(2).should eq("Bi")
  end

  it "enocodes any integer" do
    Koremutake.encode(10610353957).should eq("Koremutake")
    Koremutake.encode(65535).should eq("Botretre")
  end

  it "decodes 2" do
    Koremutake.decode("Bi").should eq(2)
  end

  it "decodes the very special string \"Koremutake\"" do
    Koremutake.decode("Koremutake").should eq(10610353957)
  end

  it "can decode the encoded number" do
    (0..65535).each do |integer|
      encoded = Koremutake.encode(integer)
      Koremutake.decode(encoded).should eq(integer)
    end
  end
end

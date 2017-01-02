# frozen_string_literal: true
require "day9"

describe Day9 do
  describe "#decompress" do
    it "decompresses data" do
      expect(subject.decompress("ADVENT")).to eq "ADVENT"
      expect(subject.decompress("A(1x5)BC")).to eq "ABBBBBC"
      expect(subject.decompress("(3x3)XYZ")).to eq "XYZXYZXYZ"
      expect(subject.decompress("A(2x2)BCD(2x2)EFG")).to eq "ABCBCDEFEFG"
      expect(subject.decompress("X(8x2)(3x3)ABCY")).to eq "X(3x3)ABC(3x3)ABCY"
    end
  end
end

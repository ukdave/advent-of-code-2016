# frozen_string_literal: true
require "day9"

describe Day9 do
  describe "#decompress_v1" do
    it "decompresses data" do
      expect(subject.decompress_v1("ADVENT")).to eq "ADVENT"
      expect(subject.decompress_v1("A(1x5)BC")).to eq "ABBBBBC"
      expect(subject.decompress_v1("(3x3)XYZ")).to eq "XYZXYZXYZ"
      expect(subject.decompress_v1("A(2x2)BCD(2x2)EFG")).to eq "ABCBCDEFEFG"
      expect(subject.decompress_v1("X(8x2)(3x3)ABCY")).to eq "X(3x3)ABC(3x3)ABCY"
    end
  end

  describe "#decompress_v1_len" do
    it "calculates the length of the decompressed data" do
      expect(subject.decompress_v1_len("ADVENT")).to eq 6
      expect(subject.decompress_v1_len("A(1x5)BC")).to eq 7
      expect(subject.decompress_v1_len("(3x3)XYZ")).to eq 9
      expect(subject.decompress_v1_len("A(2x2)BCD(2x2)EFG")).to eq 11
      expect(subject.decompress_v1_len("X(8x2)(3x3)ABCY")).to eq 18
    end
  end

  describe "#decompress_v2_len" do
    it "calculates the length of the decompressed data" do
      expect(subject.decompress_v2_len("ADVENT")).to eq 6
      expect(subject.decompress_v2_len("A(1x5)BC")).to eq 7
      expect(subject.decompress_v2_len("(3x3)XYZ")).to eq 9
      expect(subject.decompress_v2_len("A(2x2)BCD(2x2)EFG")).to eq 11
      expect(subject.decompress_v2_len("X(8x2)(3x3)ABCY")).to eq 20
      expect(subject.decompress_v2_len("(27x12)(20x12)(13x14)(7x10)(1x12)A")).to eq 241_920
      expect(subject.decompress_v2_len("(25x3)(3x3)ABC(2x3)XY(5x2)PQRSTX(18x9)(3x2)TWO(5x7)SEVEN")).to eq 445
    end
  end
end

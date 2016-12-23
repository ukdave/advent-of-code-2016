# frozen_string_literal: true
require "day4"

describe Day4 do
  describe "#calculate_checksum" do
    it "calculates the checksum" do
      expect(subject.calculate_checksum("aaaaa-bbb-z-y-x")).to eq "abxyz"
      expect(subject.calculate_checksum("a-b-c-d-e-f-g-h")).to eq "abcde"
      expect(subject.calculate_checksum("not-a-real-room")).to eq "oarel"
    end
  end

  describe "#sum_valid_sector_ids" do
    it "returns true for valid checksums" do
      lines = ["aaaaa-bbb-z-y-x-123[abxyz]",
               "a-b-c-d-e-f-g-h-987[abcde]",
               "not-a-real-room-404[oarel]",
               "totally-real-room-200[decoy]"]
      expect(subject.sum_valid_sector_ids(lines)).to eq 1514
    end
  end

  describe "#decrypt_room_name" do
    it "decrypts room names" do
      expect(subject.decrypt_room_name("qzmt-zixmtkozy-ivhz", 343)).to eq "very encrypted name"
    end
  end
end

# frozen_string_literal: true
require "day5"

describe Day5 do
  describe "#find_interesting_hash" do
    it "returns an interesting hash" do
      expect(subject.find_interesting_hash("abc", 0)).to eq hash: "00000155f8105dff7f56ee10fa9b9abd", index: 3_231_929
    end
  end

  describe "#find_password" do
    it "finds the password" do
      expect(subject.find_password("abc")).to eq "18f47a30"
    end
  end
end

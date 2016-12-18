# frozen_string_literal: true
require "day3"

describe Day3 do
  describe "#valid_triangle?" do
    it "returns false for an invalid triangle" do
      expect(described_class.valid_triangle?([5, 10, 25])).to be false
    end

    it "returns true for a valid triangle" do
      expect(described_class.valid_triangle?([5, 5, 5])).to be true
    end
  end
end

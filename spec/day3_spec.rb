# frozen_string_literal: true

require "day3"

describe Day3 do
  describe "#read_valid_triangles_by_row" do
    it "reads triangles by row and returns and filters out the invalid ones" do
      expect(subject.read_valid_triangles_by_row(File.join("data", "day3.txt")).length).to be 917
    end
  end

  describe "#read_valid_triangles_by_row" do
    it "reads triangles by row and returns and filters out the invalid ones" do
      expect(subject.read_valid_triangles_by_col(File.join("data", "day3.txt")).length).to be 1649
    end
  end

  describe "#valid_triangle?" do
    it "returns false for an invalid triangle" do
      expect(subject.valid_triangle?([5, 10, 25])).to be false
    end

    it "returns true for a valid triangle" do
      expect(subject.valid_triangle?([5, 5, 5])).to be true
    end
  end
end

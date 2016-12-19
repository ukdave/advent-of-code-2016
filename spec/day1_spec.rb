# frozen_string_literal: true
require "day1"

describe Day1 do
  describe "#shortest_path" do
    it "calculates the shortest path" do
      expect(subject.shortest_path("R2, L3")).to eq 5
      expect(subject.shortest_path("R2, R2, R2")).to eq 2
      expect(subject.shortest_path("R5, L5, R5, R3")).to eq 12
    end
  end

  describe "#first_intersection_dist" do
    it "calculates the distance to the first point that is visited twice" do
      expect(subject.first_intersection_dist("R8, R4, R4, R8")).to eq 4
    end
  end

  describe "#check_intersection" do
    it "calculates the point of intersection" do
      expect(subject.check_intersection([[2, 2], [6, 2]], [[4, 0], [4, 4]])).to eq [4, 2]
      expect(subject.check_intersection([[2, 2], [6, 2]], [[4, 0], [4, 1]])).to be_nil
      expect(subject.check_intersection([[2, 2], [6, 2]], [[2, 4], [6, 4]])).to be_nil
    end
  end
end

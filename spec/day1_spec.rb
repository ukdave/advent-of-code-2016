# frozen_string_literal: true
require "day1"

describe Day1 do
  it "calculates the shortest path" do
    expect(subject.call("R2, L3")).to eq 5
    expect(subject.call("R2, R2, R2")).to eq 2
    expect(subject.call("R5, L5, R5, R3")).to eq 12
  end
end

# frozen_string_literal: true
require "day2"

describe Day2 do
  it "calculates the access code" do
    expect(subject.call(%w(ULL RRDDD LURDL UUUUD))).to eq "1985"
  end
end

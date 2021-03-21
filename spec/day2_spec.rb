# frozen_string_literal: true

require "day2"

describe Day2 do
  describe "#calculate_code_keypad1" do
    it "calculates the access code" do
      expect(subject.calculate_code_keypad1(%w[ULL RRDDD LURDL UUUUD])).to eq "1985"
    end
  end

  describe "#calculate_code_keypad2" do
    it "calculates the access code" do
      expect(subject.calculate_code_keypad2(%w[ULL RRDDD LURDL UUUUD])).to eq "5DB3"
    end
  end
end

# frozen_string_literal: true
require "day6"

describe Day6 do
  describe "#decode" do
    it "decodes the message" do
      input = %w(eedadn drvtee eandsr raavrd atevrs tsrnev sdttsa rasrtv nssdts ntnada svetve tesnvt vntsnd vrdear dvrsen enarar)
      expect(subject.decode(input)).to eq "easter"
    end
  end
end

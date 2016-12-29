# frozen_string_literal: true
require "day6"

describe Day6 do
  let(:input) { %w(eedadn drvtee eandsr raavrd atevrs tsrnev sdttsa rasrtv nssdts ntnada svetve tesnvt vntsnd vrdear dvrsen enarar) }

  describe "#decode" do
    it "decodes the message" do
      expect(subject.decode(input)).to eq "easter"
    end
  end

  describe "#decode2" do
    it "decodes the message" do
      expect(subject.decode2(input)).to eq "advent"
    end
  end
end

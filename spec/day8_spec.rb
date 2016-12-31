# frozen_string_literal: true
require "day8"

describe Day8 do
  subject { described_class.new(7, 3) }

  describe "#draw_rect" do
    it "draws rectangles" do
      expect(subject.draw_rect(3, 2).to_s).to eq "###....\n"\
                                                 "###....\n"\
                                                 "......."
    end
  end

  describe "#rotate_col" do
    before do
      subject.draw_rect(3, 2)
    end

    it "rotates columns" do
      expect(subject.rotate_column(1, 1).to_s).to eq "#.#....\n"\
                                                     "###....\n"\
                                                     ".#....."
    end
  end

  describe "#rotate_row" do
    before do
      subject.draw_rect(3, 2)
      subject.rotate_column(1, 1)
    end

    it "rotates rows" do
      expect(subject.rotate_row(0, 4).to_s).to eq "....#.#\n"\
                                                  "###....\n"\
                                                  ".#....."
    end
  end

  describe "process_commands" do
    let(:cmds) {
      ["draw rect 3x2",
       "rotate column x=1 by 1",
       "rotate row y=0 by 4",
       "rotate column x=1 by 1"]
    }

    it "proceses commands correctly" do
      expect(subject.process_commands(cmds).to_s).to eq ".#..#.#\n"\
                                                        "#.#....\n"\
                                                        ".#....."
    end
  end

  describe "count_on" do
    before do
      subject.draw_rect(3, 2)
    end

    it "returns the number of pixels that are on" do
      expect(subject.count_on).to eq 6
    end
  end
end

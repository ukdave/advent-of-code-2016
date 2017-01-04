# frozen_string_literal: true
require "day10"

describe Day10 do
  describe "#process_command" do
    it "processes commands" do
      subject.process_command("value 3 goes to bot 1")
      subject.process_command("value 2 goes to bot 2")
      subject.process_command("value 5 goes to bot 2")
      expect(subject.get_bot(1)[:values]).to eq [3]
      expect(subject.get_bot(2)[:values]).to eq [2, 5]

      subject.process_command("bot 2 gives low to bot 1 and high to bot 0")
      expect(subject.get_bot(0)[:values]).to eq [5]
      expect(subject.get_bot(1)[:values]).to eq [3, 2]
      expect(subject.get_bot(2)[:values]).to eq []

      subject.process_command("bot 1 gives low to bot 0 and high to output 1")
      expect(subject.get_bot(0)[:values]).to eq [5, 2]
      expect(subject.get_bot(1)[:values]).to eq []
      expect(subject.get_bot(2)[:values]).to eq []
      expect(subject.get_output(1)[:values]).to eq [3]
    end
  end

  describe "#process_commands" do
    it "processes commands" do
      subject.process_commands(["value 5 goes to bot 2",
                                "bot 2 gives low to bot 1 and high to bot 0",
                                "value 3 goes to bot 1",
                                "bot 1 gives low to output 1 and high to bot 0",
                                "bot 0 gives low to output 2 and high to output 0",
                                "value 2 goes to bot 2"])
      expect(subject.get_bot(0)[:values]).to eq []
      expect(subject.get_bot(1)[:values]).to eq []
      expect(subject.get_bot(2)[:values]).to eq []
      expect(subject.get_output(0)[:values]).to eq [5]
      expect(subject.get_output(1)[:values]).to eq [2]
      expect(subject.get_output(2)[:values]).to eq [3]
    end
  end
end

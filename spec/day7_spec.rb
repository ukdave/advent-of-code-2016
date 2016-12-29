# frozen_string_literal: true
require "day7"

describe Day7 do
  describe "#supports_tls?" do
    it "returns true for addresses that support TLS" do
      expect(subject.supports_tls?("abba[mnop]qrst")).to eq true
      expect(subject.supports_tls?("ioxxoj[asdfgh]zxcvbn")).to eq true
    end

    it "returns false for addresses that do not support TLS" do
      expect(subject.supports_tls?("abcd[bddb]xyyx")).to eq false
      expect(subject.supports_tls?("aaaa[qwer]tyui")).to eq false
    end
  end

  describe "#supports_ssl?" do
    it "returns true for addresses that support SSL" do
      expect(subject.supports_ssl?("aba[bab]xyz")).to eq true
      expect(subject.supports_ssl?("aaa[kek]eke")).to eq true
      expect(subject.supports_ssl?("zazbz[bzb]cdb")).to eq true
    end

    it "returns false for addresses that do not support SSL" do
      expect(subject.supports_ssl?("xyx[xyx]xyx")).to eq false
    end
  end
end

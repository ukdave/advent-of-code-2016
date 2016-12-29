# frozen_string_literal: false
class Day7
  def select_tls_addresses addresses
    addresses.select {|address| supports_tls? address }
  end

  # rubocop:disable MethodLength, Semicolon
  def supports_tls? address
    non_hypernets = []; hypernets = []
    address.split(/[\[|\]]/).each_slice(2) do |(a, b)|
      non_hypernets << a unless a.nil?
      hypernets << b unless b.nil?
    end
    hypernets.all? {|e| !has_abba? e } && non_hypernets.any? {|e| has_abba? e }
  end
  # rubocop:enable all

  private

  def has_abba? str
    str.each_char.each_cons(4).map(&:join).any? {|segment| abba?(segment) }
  end

  def abba? str
    str.length == 4 && str[0] != str[1] && str[0] == str[3] && str[1] == str[2]
  end
end

# frozen_string_literal: false
class Day7
  def select_tls_addresses addresses
    addresses.select {|address| supports_tls? address }
  end

  def select_ssl_addresses addresses
    addresses.select {|address| supports_ssl? address }
  end

  def supports_tls? address
    supernets, hypernets = split_address address
    hypernets.all? {|e| !has_abba? e } && supernets.any? {|e| has_abba? e }
  end

  # rubocop:disable MethodLength
  def supports_ssl? address
    supernets, hypernets = split_address address
    supernets.any? do |supernet|
      supernet.each_char.each_cons(3).map(&:join).any? do |e|
        aba?(e) && hypernets.any? {|hypernet| hypernet.include?(aba_2_bab(e)) }
      end
    end
  end
  # rubocop:enable all

  private

  def split_address address
    address.split(/[\[|\]]/).each_slice(2).with_object([[], []]) do |(a, b), (supernets, hypernets)|
      supernets << a unless a.nil?
      hypernets << b unless b.nil?
    end
  end

  def has_abba? str
    str.each_char.each_cons(4).map(&:join).any? {|segment| abba?(segment) }
  end

  def abba? str
    str.length == 4 && str[0] != str[1] && str[0] == str[3] && str[1] == str[2]
  end

  def aba? str
    str.length == 3 && str[0] != str[1] && str[0] == str[2]
  end

  def aba_2_bab aba
    "#{aba[1]}#{aba[0]}#{aba[1]}"
  end
end

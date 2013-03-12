# encoding: utf-8

String.class_eval do
  def possessive
    return self if self.empty?
    case self
    when "I" then "my"
    when /^([yY])ou$/ then "#{$1}our"
    when /s$/ then self + Possessive::APOSTROPHE
    else self + Possessive::APOSTROPHE + "s"
    end
  end

  def from_possessive
    return self if self.empty?
    case self
    when /^my$/i then "I"
    when /^([yY])our$/i then "#{$1}ou"
    when /(.*)#{Possessive::APOSTROPHE}/ then $1
    when /(.*)'/ then $1
    else self
    end
  end
end

module Possessive
  APOSTROPHE = '’'
end

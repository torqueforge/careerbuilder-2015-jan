# DO NOT CHANGE THIS CODE !!!
# DO NOT CHANGE THIS CODE !!!
# DO NOT CHANGE THIS CODE !!!
# Assume Animals is part of an external framework that you cannot change.

# This does not work in ruby 1.9.3
# module Article
#   refine String do
#     def articlize
#       "#{article} #{self}"
#     end

#     def article
#       starts_with_vowel? ? 'an' : 'a'
#     end

#     def starts_with_vowel?
#       match(/\b[aeiou]/)
#     end
#   end
# end

# Only choice is 1.9.3 is monkey patching
class String
  def articlize
    "#{article} #{self}"
  end

  def article
    starts_with_vowel? ? 'an' : 'a'
  end

  def starts_with_vowel?
    match(/\b[aeiou]/)
  end
end

module Animal

  Animal = Struct.new(:species, :sound)

  DATA = {
    cow:   'moo',
    dog:   'woof',
    duck:  'quack',
    pig:   'oink',
    owl:   'hoot',
    sheep: 'baa',
    yak:   'low'
  }

  def self.all(names)
    names.collect {|name|
      if (sound = DATA[name.to_sym])
        Animal.new(name, sound)
      else
        nil
      end
    }
  end
end

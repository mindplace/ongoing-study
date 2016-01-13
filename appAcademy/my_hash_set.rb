# MyHashSet
#
# Ruby provides a class named `Set`. A set is an unordered collection of
# values with no duplicates.  You can read all about it in the documentation:
#
# http://www.ruby-doc.org/stdlib-2.1.2/libdoc/set/rdoc/Set.html
#
# Let's write a class named `MyHashSet` that will implement some of the
# functionality of a set. Our `MyHashSet` class will utilize a Ruby hash to keep
# track of which elements are in the set.  Feel free to use any of the Ruby
# `Hash` methods within your `MyHashSet` methods.
#
# Write a `MyHashSet#initialize` method which sets an empty hash object to
# `@store`. Next, write an `#insert(el)` method that stores `el` as a key
# in `@store`, storing `true` as the value. Write an `#include?(el)`
# method that sees if `el` has previously been `insert`ed by checking the
# `@store`; return `true` or `false`.
#
# Next, write a `#delete(el)` method to remove an item from the set.
# Return `true` if the item had been in the set, else return `false`.  Add
# a method `#to_a` which returns an array of the items in the set.
#
# Next, write a method `set1#union(set2)` which returns a new set which
# includes all the elements in `set1` or `set2` (or both). Write a
# `set1#intersect(set2)` method that returns a new set which includes only
# those elements that are in both `set1` and `set2`.
#
# Write a `set1#minus(set2)` method which returns a new set which includes
# all the items of `set1` that aren't in `set2`.

class MyHashSet
  def initialize(options={})
    @options = options
  end
  
  def insert(item)
    @options[item] = true
  end
  
  def include?(item)
    @options.keys.include?(item)
  end
  
  def delete(item)
    @options.delete(item)
  end
  
  def to_a
    @options.keys
  end
  
  def my_each(&prc)
    i = 0
    while i < self.to_a.length
      prc.call(self.to_a[i])
      i += 1
    end
    self
  end
  
  def union(another_set)
    @another_set = another_set
    self.my_each{|key| @another_set.insert(key)}
    @another_set
  end
  
  def intersect(another_set)
    intersection = MyHashSet.new
    self.my_each{|key| intersection.insert(key) if another_set.include?(key)}
    intersection
  end
  
  def minus(another_set)
    minused_set = MyHashSet.new
    self.my_each{|key| minused_set.insert(key) unless another_set.include?(key)}
    minused_set
  end
end
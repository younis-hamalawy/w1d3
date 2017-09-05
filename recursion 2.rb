require 'byebug'
# # Write a recursive method, range, that takes a start and an end and
# returns an array of all numbers between. If end < start, you can return
# the empty array.
# # Write both a recursive and iterative version of sum of an array.


def range(range_start, range_end)
  return [] if range_end < range_start
  return [range_end] if range_end == range_start
  result = [range_end]
  range(range_start, range_end - 1) + result
end

def range_iterative(range_start, range_end)
  result = []
  (range_start..range_end).each do |el|
    result << el
  end
  result
end

def sum_of_array(arr)
  return arr[0] if arr.length <= 1
  arr[0] + sum_of_array(arr[1..-1])
end

def sum_of_array_iterative(arr)
  result = 0
  arr.each do |num|
    result += num
  end
  result
end

def exponent(num, power, recursion_counter = 0 )
  return 1 if power == 0
  return num if power == 1
  recursion_counter += 1
  p recursion_counter
  num * exponent(num, power - 1, recursion_counter)
end

def exponent_two(num, power, recursion_counter = 0)
  #debugger
  recursion_counter += 1
  p recursion_counter
  return 1 if power == 0
  return num if power == 1

  if power.even?
    exponent_two(num, power / 2, recursion_counter) * exponent_two(num, power / 2, recursion_counter)
  else
    num * (exponent_two(num, (power - 1) / 2, recursion_counter) * exponent_two(num, (power - 1) / 2, recursion_counter))
  end
end

def deep_dup(arr)
  result = []
  arr.each do |el|
    result << if el.class == Array
                deep_dup(el)
              else
                el
              end
  end
  result
end

def fib(n)
  return [1] if n == 1
  return [1, 1] if n == 2
  prev_fib = fib(n-1)
  prev_fib + [prev_fib[-2] + prev_fib[-1]]
end

def fib_iterative(n)
  return [1] if n == 1
  base = [1,1]
  until base.length == n
    base << (base[-2] + base[-1])
  end
  base
end

def subsets(arr)
  return [[]] if arr.empty?
  subsets(arr[0...-1]) + subsets(arr[0...-1]).map {|el| el << arr[-1]}
end

def perm_iteration(arr)
  result = []
  arr.length.times do |i|
    result << [arr[i]] + (arr - [arr[i]]).rotate
  end
  result
end

def perm(array)
  return [array] if array.length == 1
  result = []
  perm(array[0...-1]).each do |arr|
    added = (arr << array.last)
    array.length.times do |i|
      result << added.rotate(i)
    end
  end
  result.sort
end

def perm_2(arr)
  return [arr] if arr.length == 1
  result = []
  arr.each do |el|
    result += perm_2(arr - [el]) .map { |sub_arr| [el] + sub_arr }
  end
  result
end

def perm_3(arr)
  return [arr] if arr.length == 1
  result = []
  arr.each do |el|
    perm_3(arr - [el]).each do |rec|
      result << [el] + rec
    end
  end
  result
end

def bsearch (arr, target)

  half = (arr.length / 2)
  return half if arr[half] == target
  left = arr[0...half]
  right = arr[(half+1)..-1]

  if target > left.last
    (half + 1) + bsearch(right, target)
  else
    bsearch(left, target)
  end
end

def merge_sort(arr)
  return arr if arr.length <= 1
  half = (arr.length / 2)
  left = arr[0...half]
  right = arr[half..-1]

  merge(merge_sort(left), merge_sort(right))
end

def merge(left, right)
  sorted = []
  (left + right).each do
    if right[0].nil?
      sorted << left.shift
    elsif left[0].nil?
      sorted << right.shift
    elsif left[0] < right[0]
      sorted << left.shift
    else
      sorted << right.shift
    end
  end
  sorted
end

def greedy_change(amount, coins = [25, 10, 5, 1])

end

def make_better_change(amount, coins = [25, 10, 5, 1])
  result = []
  rst = []
  #  debugger
  remainder = amount
  coins.each do |coin|

    time = remainder / coin
    remainder = amount % coin
    time.times do
      rst << coin

    end
  end
  result << rst
  rst = []
  if coins.length == 1
    amount.times do
      rst << coins.first
    end
    result << rst
    return result
  end
  result << make_better_change(amount, coins[1..-1]) if coins.length > 1
  result.sort_by(&:length).first
end

  def permutations(array)
    debugger
    return [array] if array.length <= 1

    first = array.shift

    perms = permutations(array)

    total_permutations = []


    perms.each do |perm|
      (0..perm.length).each do |i|
        total_permutations << perm[0 ... i] + [first] + perm[i .. -1]
      end
    end
    total_permutations
  end


 permutations([1,2,3])

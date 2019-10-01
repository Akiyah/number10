#! /usr/bin/ruby

def ten_able?(ns)
  l = ns.length
  if l == 1
    return ns[0] == 10
  end

  (0...l).to_a.permutation(2) do |is|
    i0 = is[0]
    i1 = is[1]
    n0 = ns[i0]
    n1 = ns[i1]
    ns_r = ns.select.with_index { |n, j| j != i0 && j != i1 }
    return true if ten_able?([n0 + n1] + ns_r)
    return true if ten_able?([n0 * n1] + ns_r)
    return true if ten_able?([n0 - n1] + ns_r)
    return true if n1 != 0 && ten_able?([n0 / n1.to_r] + ns_r)
  end
  return false
end

(1..9).to_a.combination(4).each do |ns|
#(1..9).to_a.repeated_combination(4).each do |ns|
    p ns unless ten_able?(ns)
end

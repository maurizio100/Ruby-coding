def beeramid(bonus, price)
  beers = (bonus / price).round
  count = 0
  beers -= (count + 1)**2

  until beers.negative?
    count += 1
    beers -= (count + 1)**2
  end

  count
end

puts beeramid(1, 2)

def bingo(ticket,win)
  ticket.each do |t|
    code = t[0]
    win_number = t[1]
    
    code.each_char do |c|
      if c.ord == win_number
        win -= 1
      end
    end
  end

  return "Loser!" if win > 0
  return "Winner!" if win <= 0
end

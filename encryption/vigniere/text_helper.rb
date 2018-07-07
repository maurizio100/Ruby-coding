module TextHelper
  def letter?(lookAhead)
    lookAhead =~ /[[:alpha:]]/
  end
end

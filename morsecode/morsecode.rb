require_relative 'morse_alphabet'

def decodeMorse(morseCode)
    result = ''
    words = morseCode.split('   ')
    words.each do |x|
        result += x.split(' ').map {|l| MORSE_CODE[l]}.join + ' '
    end
    return result.strip
end

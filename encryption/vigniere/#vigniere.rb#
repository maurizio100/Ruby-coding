require "./text_helper"

class VigniereEncryptor

  def initialize
    @vigniere_table = create_vigniere_table
  end

  def encrypt(key,clear_text)
    vigniere_table = @vigniere_table
    encrypted_text = ""
    i=0

    clear_text.each_char do |c|
      encrypted_letter = c

      if letter? c
        letter = key[i]

        table_index = letter.ord % 'a'.ord
        crypt_line = vigniere_table[table_index]

        encrypted_letter = crypt_line[c.ord % 'a'.ord]
        i = (i + 1) % 5
      end

      encrypted_text += encrypted_letter
    end

    return encrypted_text
  end

  def decrypt(key, cypher)
    vigniere_table = @vigniere_table
    basis_line = vigniere_table[0]
    clear_text = ""
    i=0

    cypher.each_char do |c|
      clear_letter = c
      if letter? c
        key_letter = key[i]
        table_index = key_letter.ord % 'a'.ord
        crypt_line = vigniere_table[table_index]
        clear_letter = basis_line[crypt_line.index c]
        i = (i+1) % 5
      end

      clear_text += clear_letter
    end

    return clear_text
  end

  private

  @vigniere_table = nil

  def create_vigniere_table
    vigniere_table = []
    vigniere_line = ('a'..'z').to_a
    vigniere_table[0] = vigniere_line

    (1..26).each do |l|
      vigniere_table[l] = vigniere_table[(l-1)].rotate
    end

    return vigniere_table
  end

  include TextHelper
end

#ich mach mir hier einen neuen verschluessler
vigniere_encryptor = VigniereEncryptor.new
clear_text = "ehrgeiz witz fleiss geekstuff liebe fuersorge grant temperament faulheit tierliebe"
key = "anima"

#hier verschluessle ich nun text "hello", es wird der schluessel "anima" verwendet
cypher = vigniere_encryptor.encrypt  key, clear_text

#ich verwende hier uebrigens die ganze zeit funktionen!!!!!
#die haben den code drin und ich kann sie dann verwenden wo ich will!!

puts "Clear text: #{clear_text}, Key: #{key}"
# diese zeile zeigt mir was das ergebnis ist :: hrtxo
puts "Cypher: #{cypher}"

=begin
jetzt entschluessle ich den obigen text wieder.
Verwende dafuer wieder den schluessel anima
=end
decrypt = vigniere_encryptor.decrypt "anima", cypher
#das resultat ist .... hello :-)
puts "Decryption 1 - correct key: #{decrypt}"

=begin
jetzt verwende ich einen anderen schluessel
=end
decrypt = vigniere_encryptor.decrypt "junior", cypher

puts "Decryption 2 - wrong key: #{decrypt}"

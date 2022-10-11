class EntityType < ApplicationRecord
  validates :text, presence: true, uniqueness: true
  validates :color, presence: true

  def text_color
    # Background color is stored in HEX format
    hex_color = color.gsub('#','')
    r, g, b = hex_color.scan(/../).map { |color| color.hex }

    # HSP (Highly Sensitive Poo) equation from http://alienryderflex.com/hsp.html
    hsp = Math.sqrt(0.299 * (r * r) + 0.587 * (g * g) + 0.114 * (b * b))

    # Using the HSP value, determine whether the color is light or dark
    hsp > 127.5 ? 'black' : 'white'
  end
end

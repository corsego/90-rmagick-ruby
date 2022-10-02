class ImageGenerator
  require 'pry'
  require 'RMagick'
  include Magick

  # image = Magick::Image.new(256, 64) do |img|
  #   img.background_color = 'yellow'
  # end
  # image.write('yellow.png')

  image = Image.read('boys_basketball.png').first

  # image = image.scale(0.25)
  # image = image.scale(1600, 900)
  image = image.resize_to_fit(1600, 0)
  image = image.crop(CenterGravity, 800, 418, true)
  # image = image.crop(CenterGravity, 1600, 900, true)
  image2 = Image.read('Bellaire Cardinals.png').first
  image = image.composite(image2, CenterGravity, -200, 0, OverCompositeOp)
  image3 = Image.read('Kashmere Fighting Rams.png').first
  image = image.composite(image3, CenterGravity, 200, 0, OverCompositeOp)

  text = Magick::Draw.new
  text.fill = 'red'
  text.pointsize = 48
  text.gravity = CenterGravity
  text.annotate(image, 0, 0, 0, 0, 'VS')

  text.gravity = NorthWestGravity
  text.font_weight = BoldWeight
  text.fill = '#ff55a3'
  text.annotate(image, 0, 0, 5, 5, 'Madison Square Garden')

  image.write('logo-on-background.png')
  # binding.pry
end

# This challenge is based off of problem 1
# modify it such that it also accepts in the hash, a color (whose values are red("#FF0000"), green("#00FF00"), and blue(#0000FF) )
# if the color is set, then it should show up in the style
# It should also not be necessary to pass in the hash, if you don't want to specify options
#
#
# EXAMPLE:
#
# html = HTMLTag.new 'p', 'Hello World', :multiline => false, :color => :red
# html.to_s     # => <p style="color:#FF0000">Hello World</p>
#
# sports = [
#   HTMLTag.new('li', 'baseball', :multiline => false, :color => :red,   :font => :serif) ,
#   HTMLTag.new('li', 'soccer',   :multiline => false, :color => :green, :font => :sans_serif) ,
#   HTMLTag.new('li', 'football', :multiline => false, :color => :blue,  :font => :monospace) ,
# ]
#
# ordered_list = HTMLTag.new 'ol' , sports.join , :multiline => true
#
# puts ordered_list  # => (as output)
#                      <ol >
#                      <li style='color:#FF0000;font-family:"Times New Roman", "Georgia"'>baseball</li>
#                      <li style='color:#00FF00;font-family:"Arial", "Verdana"'>soccer</li>
#                      <li style='color:#0000FF;font-family:"Courier New", "Lucida Console"'>football</li>
#                      </ol>

class HTMLTag
  FONTS = {
    serif:      '"Times New Roman", "Georgia"',
    sans_serif: '"Arial", "Verdana"',
    monospace:  '"Courier New", "Lucida Console"'
  }

  COLORS = {
    red:        "#FF0000",
    green:      "#00FF00",
    blue:       "#0000FF"
  }

  attr_accessor :name, :innerHTML

  def initialize(name, innerHTML, options={})
    @name, @innerHTML = name, innerHTML

    unless options.nil?
      @multiline = options[:multiline]
      @color = options[:color]
      @font = options[:font]
    end
  end

  def font
    FONTS[@font]
  end

  def font_to_s
    "font-family:#{font};" unless font.nil?
  end

  def color
    COLORS[@color]
  end

  def color_to_s
    "color:#{color};" unless color.nil?
  end

  def styles_available?
    !!(font_to_s || color_to_s)
  end

  def style
    if styles_available?
      "style='#{font_to_s}#{color_to_s}'"
    end
  end

  def to_s
    line_end = if @multiline then "\n" else "" end
    "<#{name} #{style}>#{line_end}"  \
    "#{innerHTML.chomp}#{line_end}"  \
    "</#{name}>\n"
  end

end

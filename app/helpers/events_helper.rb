module EventsHelper

  def random_color
    colors = ["AliceBlue","Aqua",
              "Aquamarine","Azure","Beige","Bisque",
              "Black","Blue","BlueViolet",
              "Brown","BurlyWood","CadetBlue","Chartreuse",
              "Chocolate","Coral","CornflowerBlue",
              "Crimson","Cyan","DarkBlue","DarkCyan","DarkGoldenRod",
              "DarkGray","DarkGrey","DarkGreen","DarkKhaki","DarkMagenta",
              "DarkOliveGreen","Darkorange","DarkOrchid","DarkRed","DarkSalmon",
              "DarkSeaGreen","DarkSlateBlue","DarkSlateGray","DarkSlateGrey",
              "DarkTurquoise","DarkViolet","DeepPink","DeepSkyBlue","DimGray",
              "DimGrey","DodgerBlue","FireBrick","ForestGreen",
              "Fuchsia","Gold","GoldenRod","Gray",
              "Grey","Green","GreenYellow","HoneyDew","HotPink","IndianRed",
              "Indigo","Ivory","Khaki","Lavender","LavenderBlush","LawnGreen",
              "LightBlue","LightCoral","LightCyan",
              "LightGoldenRodYellow","LightGray",
              "LightGreen","LightPink","LightSalmon","LightSeaGreen",
              "LightSkyBlue","LightSlateGray","LightSlateGrey",
              "LightSteelBlue","Lime","LimeGreen",
              "Linen","Magenta","Maroon","MediumAquaMarine",
              "MediumBlue","MediumOrchid","MediumPurple","MediumSeaGreen",
              "MediumSlateBlue","MediumSpringGreen","MediumTurquoise",
              "MediumVioletRed","MidnightBlue","MintCream",
              "Moccasin","Navy","OldLace","Olive","OliveDrab",
              "Orange","OrangeRed","Orchid","PaleGoldenRod","PaleGreen",
              "PaleTurquoise","PaleVioletRed","PapayaWhip","PeachPuff","Peru",
              "Pink","Plum","PowderBlue","Purple","Red","RosyBrown",
              "RoyalBlue","SaddleBrown","Salmon","SandyBrown","SeaGreen",
              "Sienna","Silver","SkyBlue","SlateBlue",
              "SlateGray","SlateGrey","Snow","SpringGreen","SteelBlue",
              "Tan","Teal","Thistle","Tomato","Turquoise",
              "Violet","Wheat","Yellow",
              "YellowGreen"]

    colors.sample
  end
end

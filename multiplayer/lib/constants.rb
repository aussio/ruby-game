FONT_SIZE = 20
MEDIA_PATH = 'media/kenney/PNG'
SCREEN_SIZE_X = 1000
SCREEN_SIZE_Y = 1000
PLAYER_SIZE = 64
TICKS_PER_SECOND = 20

module ZOrder
  BACKGROUND, STARS, PLAYER, UI = *0..3
end

module KeyboardInputs
  class ArrowKeys
    LEFT = Gosu::KB_LEFT
    RIGHT = Gosu::KB_RIGHT
    UP = Gosu::KB_UP
    DOWN = Gosu::KB_DOWN
  end

  class ASWD
    LEFT = Gosu::KB_A
    RIGHT = Gosu::KB_D
    UP = Gosu::KB_W
    DOWN = Gosu::KB_S
  end
end
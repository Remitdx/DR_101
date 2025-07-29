module Scenes
  class Gameover
    def gameover_tick(args)
      args.outputs.labels << {
        x: 20,
        y: 680,
        text: "Game over",
        size_px: 20,
      }
    end
  end
end
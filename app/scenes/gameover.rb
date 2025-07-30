module Scenes
  class Gameover
    def gameover_tick(args)
      args.outputs.labels << {  x: args.grid.w / 2 ,
                                y: 690,
                                text: "Game over",
                                size_px: 80,
                                alignment_enum: 1,
                                r: 0,
                                g: 0,
                                b: 0
                              } 
    end
  end
end
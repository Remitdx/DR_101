module Scenes
  class Gameover
    def gameover_tick(args)
      args.outputs.labels << {  x: args.grid.w / 2 ,
                                y: 660,
                                text: "Game over",
                                size_px: 80,
                                alignment_enum: 1,
                                r: 0,
                                g: 0,
                                b: 0
                              }
      # background                       
      args.outputs.solids << {  x: 0,
                                y: 0,
                                w: args.grid.w,
                                h: args.grid.h,
                                r: 255,
                                g: 209,
                                b: 26
                              }
    end
  end
end
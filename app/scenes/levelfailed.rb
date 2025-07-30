module Scenes
  class Levelfailed
    def levelfailed_tick(args)
      args.outputs.labels << {  x: args.grid.w / 2 ,
                                y: 690,
                                text: "Level #{args.state.current_lvl + 1} failed",
                                size_px: 80,
                                alignment_enum: 1,
                                r: 0,
                                g: 0,
                                b: 0
                              }
      args.outputs.sprites << { x: args.grid.w / 2 - 60,
                                y: 300,
                                w: 120,
                                h: 120,
                                path: 'sprites/target.png'
                              }
      
      args.outputs.labels << {  x: args.grid.w / 2 ,
                                  y: 240,
                                  text: "Press space to start to try again.",
                                  size_px: 40,
                                  alignment_enum: 1,
                                  r: 0,
                                  g: 0,
                                  b: 0
                                }
      args.outputs.labels << {  x: args.grid.w / 2 ,
                                  y: 180,
                                  text: "Press esc to main menu.",
                                  size_px: 40,
                                  alignment_enum: 1,
                                  r: 0,
                                  g: 0,
                                  b: 0
                                }

      if args.inputs.keyboard.key_down.space || args.inputs.controller_one.key_down.a
        args.state.scene = "gameplay"
        args.state.quote = nil
        return
      end

      if args.inputs.keyboard.key_down.escape || args.inputs.controller_one.key_down.b
        args.state.scene = "menu"
        args.state.quote = nil
        return
      end

      pick_quote args
    end
  end
end
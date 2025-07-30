module Scenes
  class Levelsucceed
    def levelsucceed_tick(args)
      args.outputs.labels << {  x: args.grid.w / 2 ,
                                y: 690,
                                text: "Level #{args.state.current_lvl + 1} succeed",
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
      args.outputs.sprites << {  x: args.grid.w / 2 - 60,
                                y: 400,
                                w: 120,
                                h: 120,
                                path: 'sprites/caca.png'
                              }
      args.outputs.labels << {  x: args.grid.w / 2 ,
                                  y: 200,
                                  text: "Press esc to main menu.",
                                  size_px: 40,
                                  alignment_enum: 1,
                                  r: 0,
                                  g: 0,
                                  b: 0
                                }

      if args.inputs.keyboard.key_down.escape || args.inputs.controller_one.key_down.b
        args.state.scene = "menu"
        return
      end 
    end
  end
end
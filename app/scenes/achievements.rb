module Scenes
  class Achievements
    def achievements_tick(args)
      args.outputs.labels << {  x: args.grid.w / 2 ,
                                y: 690,
                                text: "Achievements",
                                size_px: 80,
                                alignment_enum: 1,
                                r: 0,
                                g: 0,
                                b: 0
                              }
      args.outputs.labels << {  x: args.grid.w / 2 ,
                                y: 560,
                                text: "Total hits : #{args.state.total_hits} / 500",
                                size_px: 40,
                                alignment_enum: 1,
                                r: 0,
                                g: 0,
                                b: 0
                              }
      args.outputs.labels << {  x: args.grid.w / 2 ,
                                y: 500,
                                text: "All levels cleared : #{args.state.levels_completed.include?(false) ? "No" : "Yes"}",
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
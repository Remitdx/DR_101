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
      if args.state.total_hits < 500
        args.outputs.sprites << { x: args.grid.w / 6 * 5, y: 520, w:60, h:60, path: "sprites/unchecked.png" }
      else
        args.outputs.sprites << { x: args.grid.w / 6 * 5, y: 520, w:60, h:60, path: "sprites/approved.png" }
      end
      args.outputs.labels << {  x: args.grid.w / 6 ,
                                y: 560,
                                text: "Hit target 500 times.",
                                size_px: 40,
                                r: 0,
                                g: 0,
                                b: 0
                              }
      args.outputs.labels << {  x: args.grid.w / 6 ,
                                y: 520,
                                text: "Progression: #{args.state.total_hits}",
                                size_px: 24,
                                r: 0,
                                g: 0,
                                b: 0
                              }
      if args.state.levels_completed.include?(false)
        args.outputs.sprites << { x: args.grid.w / 6 * 5, y: 440, w:60, h:60, path: "sprites/unchecked.png" }
      else
        args.outputs.sprites << { x: args.grid.w / 6 * 5, y: 440, w:60, h:60, path: "sprites/approved.png" }
      end
      args.outputs.labels << {  x: args.grid.w / 6 ,
                                y: 480,
                                text: "Clear all levels.",
                                size_px: 40,
                                r: 0,
                                g: 0,
                                b: 0
                              }
      args.outputs.labels << {  x: args.grid.w / 6 ,
                                y: 440,
                                text: "Progression: #{levels_completed_counter(args)}/7",
                                size_px: 24,
                                r: 0,
                                g: 0,
                                b: 0
                              }
      if quotes_saw_counter(args) < 11
        args.outputs.sprites << { x: args.grid.w / 6 * 5, y: 360, w:60, h:60, path: "sprites/unchecked.png" }
      else
        args.outputs.sprites << { x: args.grid.w / 6 * 5, y: 360, w:60, h:60, path: "sprites/approved.png" }
      end                    
      args.outputs.labels << {  x: args.grid.w / 6 ,
                                y: 400,
                                text: "Discover all target's quotes.",
                                size_px: 40,
                                r: 0,
                                g: 0,
                                b: 0
                              }
      args.outputs.labels << {  x: args.grid.w / 6 ,
                                y: 360,
                                text: "Progression: #{quotes_saw_counter(args)}/11",
                                size_px: 24,
                                r: 0,
                                g: 0,
                                b: 0
                              }
      
                              
    	if args.inputs.keyboard.key_down.escape || args.inputs.controller_one.key_down.b
        args.state.scene = "menu"
        return
      end
    end

    def levels_completed_counter args
      counter = 0
      args.state.levels_completed.each { |v| counter += 1 if v }
      counter
    end

    def quotes_saw_counter args
      counter = 0
      args.state.quotes_saw.each_value { |v| counter += 1 if v }
      counter
    end
  end
end
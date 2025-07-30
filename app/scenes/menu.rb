module Scenes
  class Menu
    def menu_tick(args)
      current_lvl_selected ||= 0

      args.outputs.labels << {  x: 1260 ,
                                y: 690,
                                text: "Press escape for achievements.",
                                size_px: 20,
                                alignment_enum: 2,
                                r: 0,
                                g: 0,
                                b: 0
                              }
      args.outputs.labels << {  x: args.grid.w / 2 ,
                                y: 690,
                                text: "Crazy Pooper",
                                size_px: 80,
                                alignment_enum: 1,
                                r: 0,
                                g: 0,
                                b: 0
                              }

      args.outputs.labels << {  x: args.grid.w / 2 ,
                                y: 590,
                                text: "Tired of getting pooped over ? Time to fight back !",
                                size_px: 30,
                                alignment_enum: 1,
                                r: 0,
                                g: 0,
                                b: 0
                              }
      
      args.state.levels ||= [ { x: 210, y: 320, w: 200, h: 200, path: "sprites/hexagon/black.png" },
                              { x: 320, y: 140, w: 200, h: 200, path: "sprites/hexagon/#{grey_or_white_tile(1, args)}.png" },
                              { x: 430, y: 320, w: 200, h: 200, path: "sprites/hexagon/#{grey_or_white_tile(2, args)}.png" },
                              { x: 540, y: 140, w: 200, h: 200, path: "sprites/hexagon/#{grey_or_white_tile(3, args)}.png" },
                              { x: 650, y: 320, w: 200, h: 200, path: "sprites/hexagon/#{grey_or_white_tile(4, args)}.png" },
                              { x: 760, y: 140, w: 200, h: 200, path: "sprites/hexagon/#{grey_or_white_tile(5, args)}.png" },
                              { x: 870, y: 320, w: 200, h: 200, path: "sprites/hexagon/#{grey_or_white_tile(6, args)}.png" }
                            ]

      current_lvl_selected = args.state.levels.index {|element| element[:path] == 'sprites/hexagon/black.png' }
      
      args.outputs.labels << {  x: args.grid.w / 2 ,
                                y: 100,
                                text: "Level #{current_lvl_selected + 1}. Press space to start.",
                                size_px: 40,
                                alignment_enum: 1,
                                r: 0,
                                g: 0,
                                b: 0
                              }

      args.outputs.labels << {  x: args.grid.w / 2 ,
                                y: 50,
                                text: args.state.levels_completed[current_lvl_selected] ? "(already completed)" : "",
                                size_px: 25,
                                alignment_enum: 1,
                                r: 0,
                                g: 0,
                                b: 0
                              }

      if args.inputs.key_down.left
        unless current_lvl_selected == 0
          args.state.levels[current_lvl_selected][:path] = "sprites/hexagon/#{grey_or_white_tile(current_lvl_selected, args)}.png"
          args.state.levels[current_lvl_selected - 1][:path] = "sprites/hexagon/black.png"
        end
      elsif args.inputs.key_down.right
        unless current_lvl_selected == 6
          args.state.levels[current_lvl_selected][:path] = "sprites/hexagon/#{grey_or_white_tile(current_lvl_selected, args)}.png"
          args.state.levels[current_lvl_selected + 1][:path] = "sprites/hexagon/black.png"
        end
      end

      if args.inputs.keyboard.key_down.escape || args.inputs.controller_one.key_down.b
        args.state.scene = "achievements"
        return
      end

      if args.inputs.keyboard.key_down.space || args.inputs.controller_one.key_down.a
        args.state.scene = "gameplay"
        args.state.current_lvl = current_lvl_selected
        return
      end

      args.outputs.sprites << args.state.levels
    end

    def grey_or_white_tile(lvl, args)
      args.state.levels_completed[lvl] ? "gray" : "white"
    end
  end
end

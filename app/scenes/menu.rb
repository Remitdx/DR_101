module Scenes
  class Menu
    def menu_tick(args)
      current_lvl_selected ||= 0

      args.outputs.labels << {  x: args.grid.w / 2 ,
                                y: 660,
                                text: "Crazy Pooper",
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

      if args.inputs.keyboard.key_down.space || args.inputs.controller_one.key_down.a
        args.state.scene = "gameplay"
        args.state.current_lvl = current_lvl_selected
        return
      end

      args.outputs.sprites << args.state.levels
    end

    def grey_or_white_tile(lvl, args)
      puts args.state.levels_completed[lvl]
      args.state.levels_completed[lvl] ? "gray" : "white"
    end
  end
end

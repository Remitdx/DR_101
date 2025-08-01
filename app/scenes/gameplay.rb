require "app/controls/player_controls"

module Scenes
  class Gameplay
    def gameplay_tick(args)

      ## SET LEVEL VARIABLES
      set_targets args
      args.state.player ||= starting_position_player
      args.state.poops ||= []
      args.state.score ||= 0
      args.state.food ||= []
      spawn_tacos(args, 300)
      spawn_burger(args, 300)


      ## LEVEL LOOSE CONDITION
      if player_collide_target? args
        args.state.scene = "levelfailed"
        reset_level args
        return
      end

      ## LEVEL WIN CONDITION
      if args.state.score > args.state.levels_goals[args.state.current_lvl]
        args.state.scene = "levelsucceed"
        reset_level args
        args.state.levels_completed[args.state.current_lvl] = true
        return
      end
      
      if args.inputs.keyboard.key_down.space || args.inputs.controller_one.key_down.a
        poop args
      end

      targets_movement args 

      args.state.poops.each do |poop|
        poop.y -= 6

        if poop.x > args.grid.w || poop.y < -20
          poop.dead = true
          next
        end

        args.state.targets.each do |target|
          handle_collisions(args, poop, target)
        end
      end

      args.state.targets.reject! { |t| t.dead }
      args.state.poops.reject! { |b| b.dead }

      Controls::PlayerControls.new args
      score_pannel_ui args               
      poop_cooldown_ui args

      args.outputs.sprites << [args.state.player, args.state.targets, args.state.poops, args.state.food]
    end

    def handle_collisions args, poop, target
      if args.state.current_lvl == 6
        boss_collisions(args, poop, target)
      else
        normal_collisions(args, poop, target)
      end
    end

    def normal_collisions args, poop, target
      if args.geometry.intersect_rect?(target, poop)
        if target[:size] < 2
          target.dead = true
          args.state.score += 12
          args.state.targets << spawn_target(args)
        else
          args.state.score += 12 / target[:size]
          target[:size] -= 1
          target[:w] = target[:size] * 32 + 32
          target[:h] = target[:w]
        end
        poop.dead = true
        args.state.total_hits += 1
      end
    end

    def boss_collisions args, poop, target
      if args.geometry.intersect_rect?(target, poop)
        poop.dead = true
        args.state.total_hits += 1
        args.state.score += 10
      end
    end

    def targets_movement args
      if args.state.current_lvl > 1
        i = 0
        args.state.targets.each do |target|
          case i
          when 0
            target[:x] = target[:x] + 2 > args.grid.w - target[:w] ? 0 : target[:x] + 2
          when 1
            target[:x] = target[:x] - 2 < 0 ? args.grid.w - target[:w] : target[:x] - 2
          when 2
            target[:y] = target[:y] + 1 > args.grid.h - target[:h] ? 0 : target[:y] + 1
          when 3 
            target[:y] = target[:y] - 1 < 0 ? args.grid.h - target[:h] : target[:y] - 1
          end
          i += 1
        end
      end
    end

    def poop args
      args.state.poops << {
          x: args.state.player.x + 25,
          y: args.state.player.y - 25,
          w: 50,
          h: 50,
          path: 'mygame/sprites/caca.png'
        }
    end

    def reset_level args
      args.state.player = starting_position_player
      args.state.targets = nil
      args.state.poops = []
      args.state.score = 0
    end

    def starting_position_player
      { x: 576,
        y: 500,
        w: 76 * 1.1,
        h: 88 * 1.1,
        speed: 8,
        path: 'mygame/sprites/dwarf.png' }
    end

    def set_targets args
      if args.state.current_lvl < 6
        args.state.targets ||= [ spawn_target(args), spawn_target(args), spawn_target(args), spawn_target(args) ]
      else
        args.state.targets ||= [spawn_target(args)]
      end
    end
    
    def spawn_target args
      if args.state.current_lvl == 0 
        size = 1
      elsif args.state.current_lvl == 6
        size = 8
      else
        size = 1 + rand(3)
      end

      new_target = {  x: rand(1200),
                      y: rand(200),
                      w: size * 32 + 32,
                      h: size * 32 + 32,
                      path: 'sprites/target.png',
                      size: size
                    }
      unless args.state.targets.nil?
        until new_target_valid?(args, new_target)
          new_target = {  x: rand(1200),
                          y: rand(200),
                          w: size * 32 + 32,
                          h: size * 32 + 32,
                          path: 'sprites/target.png',
                          size: size
                        }
        end
      end
      new_target
    end

    def spawn_tacos args, duration
      if [3,5,6].include?(args.state.current_lvl) && args.state.food.size == 0
        args.state.food << {  x: rand(1200),
                              y: rand(660),
                              w: 80,
                              h: 80,
                              path: 'sprites/tacos.png',
                            }
      end
    end

    def spawn_burger args, duration
      if [4,5,6].include?(args.state.current_lvl)
        puts "BURGER!"
      end
    end

    def score_pannel_ui args
      args.outputs.labels  << { x: 20,
                                y: 700,
                                text: "Level #{args.state.current_lvl + 1}",
                                size_px: 20,
                              }

      args.outputs.labels  << { x: 20,
                                y: 670,
                                text: "Mission : reach #{args.state.levels_goals[args.state.current_lvl]} points",
                                size_px: 20,
                              }

      args.outputs.labels  << { x: 20,
                                y: 640,
                                text: "Score : #{args.state.score.to_i}",
                                size_px: 20,
                              }

      
      args.outputs.labels  << { x: 20,
                                y: 610,
                                text: "Poopometer : #{args.state.poops.count}",
                                size_px: 20,
                              }
    end

    def poop_cooldown_ui args
      args.outputs.sprites << { x: args.grid.w - 70,
                                y: args.grid.h - 70,
                                w: 50,
                                h: 50,
                                path: 'mygame/sprites/caca.png'
                              }
      args.outputs.sprites << { x: args.grid.w - 70,
                                y: args.grid.h - 70,
                                w: 100,
                                h: 50,
                                path:'mygame/sprites/aiguille.png'
                              }       
    end

    def player_collide_target? args
      args.state.targets.each do |target|
        if args.geometry.intersect_rect?(args.state.player, target)
          return true
        end
      end
      false
    end

    def new_target_valid? args, new_target
      return false if args.geometry.intersect_rect?(args.state.player, new_target)

      args.state.targets.each do |target|
        if args.geometry.intersect_rect?(new_target, target)
          return false
        end
      end
      true
    end
  end
end
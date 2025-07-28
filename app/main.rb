def spawn_target
  size = 64
  {
    x: rand(1200),
    y: rand(200),
    w: size,
    h: size,
    path: 'sprites/macron.png'
  }
end

def handle_player_moves args
  if args.inputs.left
    args.state.player.x -= args.state.player.speed
  elsif args.inputs.right
    args.state.player.x += args.state.player.speed
  end

  if args.inputs.down
    args.state.player.y -= args.state.player.speed
  elsif args.inputs.up
    args.state.player.y += args.state.player.speed
  end

  if args.state.player.x > 1180
    args.state.player.x = 1180
  elsif args.state.player.x < 0
    args.state.player.x = 0
  end

  if args.state.player.y > 620
    args.state.player.y = 620
  elsif args.state.player.y < 0
    args.state.player.y = 0
  end
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

def tick args
  args.state.player ||= { x: 576,
                          y: 500,
                          w: 100,
                          h: 100,
                          speed: 10,
                          path: 'mygame/sprites/dwarf.png' }

  args.state.balls ||= []
  args.state.score ||= 0
  args.state.targets ||= [
    spawn_target,
    spawn_target,
    spawn_target
  ]

  args.outputs.labels  << { x: 60,
                            y: 680,
                            text: "Score : #{args.state.score}",
                            size_px: 20,
                            anchor_x: 0.5,
                            anchor_y: 0.5 }

  
  
  if args.inputs.keyboard.key_down.space || args.inputs.controller_one.key_down.a
    args.state.balls << {
      x: args.state.player.x + 25,
      y: args.state.player.y - 25,
      w: 50,
      h: 50,
      path: 'mygame/sprites/caca.png'
    }
  end

  args.state.balls.each do |ball|
    ball.y -= 6

    if ball.x > args.grid.w || ball.y < 0
      ball.dead = true
      next
    end

    args.state.targets.each do |target|
      if args.geometry.intersect_rect?(target, ball)
        target.dead = true
        ball.dead = true
        args.state.score += 10
        new_target = spawn_target
        until new_target_valid?(args, new_target)
          new_target = spawn_target
        end
        args.state.targets << new_target
      end
    end
  end

  args.state.targets.reject! { |t| t.dead }
  args.state.balls.reject! { |b| b.dead }

  handle_player_moves args

  args.outputs.sprites << [args.state.player, args.state.targets, args.state.balls]
end

$gtk.reset
def tick args
  args.state.player ||= { x: 576,
                          y: 200,
                          w: 100,
                          h: 100,
                          speed: 10,
                          path: 'mygame/sprites/dwarf.png' }

  args.state.balls ||= []

  args.outputs.labels  << { x: 640,
                            y: 600,
                            text: 'Hello Rémi!',
                            size_px: 30,
                            anchor_x: 0.5,
                            anchor_y: 0.5 }

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
  
  if args.inputs.keyboard.key_down.space || args.inputs.controller_one.key_down.a
    args.state.balls << {
      x: args.state.player.x + 50,
      y: args.state.player.y - 30,
      w: 50,
      h: 50,
      path: 'mygame/sprites/caca.png'
    }
  end

  args.state.balls.each do |ball|
    ball.y -= 6
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

  args.outputs.sprites << [args.state.player, args.state.balls]
end

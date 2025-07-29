def handle_scenes(state, args)
  case state
  when  "menu"
    Scenes::Menu.new.send("#{state}_tick", args)
  when  "gameplay"
    Scenes::Gameplay.new.send("#{state}_tick", args)
  when  "gameover"
    Scenes::Gameover.new.send("#{state}_tick", args)
  end
end

def tick args
  args.state.scene ||= "gameplay"
  handle_scenes(args.state.scene, args)
end

$gtk.reset
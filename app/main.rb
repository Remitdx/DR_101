require "app/scenes/menu"
require "app/scenes/gameplay"
require "app/scenes/gameover"

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
  args.state.levels_completed ||= [ true, true, false, false, true, true, false ]
  args.state.scene ||= "menu"
  handle_scenes(args.state.scene, args)
end

$gtk.reset
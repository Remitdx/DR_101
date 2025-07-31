require "app/scenes/menu"
require "app/scenes/gameplay"
require "app/scenes/gameover"
require "app/scenes/achievements"
require "app/scenes/levelfailed"
require "app/scenes/levelsucceed"
require "app/quotes"

def handle_scenes(state, args)
  case state
  when  "menu"
    Scenes::Menu.new.send("#{state}_tick", args)
  when  "gameplay"
    Scenes::Gameplay.new.send("#{state}_tick", args)
  when  "gameover"
    Scenes::Gameover.new.send("#{state}_tick", args)
  when  "achievements"
    Scenes::Achievements.new.send("#{state}_tick", args)
  when  "levelfailed"
    Scenes::Levelfailed.new.send("#{state}_tick", args)
  when  "levelsucceed"
    Scenes::Levelsucceed.new.send("#{state}_tick", args)
  end
end

def background args
  args.outputs.solids << {  x: 0,
                            y: 0,
                            w: args.grid.w,
                            h: args.grid.h,
                            r: 255,
                            g: 195,
                            b: 25
                          }
end

def tick args
  background args                      
  args.state.total_hits ||= 0
  args.state.quotes_saw ||= { kwassa: false,	pognon: false,	
                              travail: false,	ceder: false,	predire: false,	
                              explosion: false,	responsable: false,	poudre: false,	
                              guerre: false,	projet: false,	gens: false }
  
  args.state.levels_completed ||= [ false, false, false, false, false, false, false ]
  args.state.levels_goals ||= [ 100, 200, 300, 400, 500, 600, 700 ]
  args.state.scene ||= "menu"
  handle_scenes(args.state.scene, args)
end

$gtk.reset
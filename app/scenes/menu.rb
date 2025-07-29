module Scenes
  class Menu
    def menu_tick(args)
      args.outputs.labels << {
        x: 20,
        y: 680,
        text: "Menu",
        size_px: 20,
      }
    end
  end
end

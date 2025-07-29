module Controls
  class PlayerControls

    def initialize args

      @args = args

      if @args.inputs.left
          @args.state.player.x -= @args.state.player.speed
      elsif @args.inputs.right
          @args.state.player.x += @args.state.player.speed
      end

      if @args.inputs.down
          @args.state.player.y -= @args.state.player.speed
      elsif @args.inputs.up
          @args.state.player.y += @args.state.player.speed
      end

      if @args.state.player.x > 1180
          @args.state.player.x = 1180
      elsif @args.state.player.x < 0
          @args.state.player.x = 0
      end

      if @args.state.player.y > 620
          @args.state.player.y = 620
      elsif @args.state.player.y < 0
          @args.state.player.y = 0
      end
    end
  end
end
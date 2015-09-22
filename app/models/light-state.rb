class LightState
  attr_reader :on_state, :color, :brightness, :blink_times, :transition_time

  def initialize
    @on_state = true
    @color = Color::NONE
    @brightness = nil
    @blink_times = 0
    @transition_time = 0
  end

  def on
    @on_state = true
    self
  end

  def off
    @on_state = false
    self
  end

  def with_color(color)
    @color = color
    self
  end

  def with_brightness(brightness)
    @brightness = brightness
    self
  end

  def with_blinks(times)
    @blink_times = times
    self
  end

  def with_transition_time(secs)
    @transition_time = secs
    self
  end

  def execute(light)
    puts "sending update: #{update}"
    result = light.set_state(update, transition_time * 10)
    blink(light)
    result
  end

  # Handy States
  On = LightState.new.on
  Off = LightState.new.off
  FullBrightness = LightState.new.with_brightness(254)
  LowBrightness = LightState.new.with_brightness(1)
  Blink = LightState.new.with_blinks(3)

  #private

  def update
    {
      on: on_state,
      xy: color.value,
      brightness: brightness,
    }.reject {|_,v| v.nil? }
  end

  def blink(light)
    frequency = transition_time / 10
    frequency = 1 if transition_time < 0.5
    blink_times.times do
      light.set_state(alert: :select)
      sleep(frequency)
    end
  end
end

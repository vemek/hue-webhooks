class WebhooksController < Sinatra::Base
  get "/" do
    redirect "/hooks"
  end

  get "/deploy" do
    fb = LightState.new.with_brightness(254).with_transition_time(1)
    nb = LightState.new.with_brightness(1).with_transition_time(2)
    change = StateChange.new([
      LightState.new.with_color(Color::GREEN),
      fb, nb, fb, nb, fb,
      LightState::Off.with_transition_time(2),
    ])
    result = change.execute(LIGHT)
    result.to_s
  end

  get "/deployfail" do
    change = StateChange.new([
      LightState.new.with_color(Color::RED).with_brightness(254),
      LightState.new.with_blinks(6),
      LightState::Off.with_transition_time(2)
    ])
    result = change.execute(LIGHT)
    result.to_s
  end
end

class StateChange
  attr_reader :states

  def initialize(states)
    @states = states
  end

  def execute(light)
    states.each do |state|
      state.execute(light)
      # allow the transition to run
      sleep(state.transition_time)
    end
  end
end

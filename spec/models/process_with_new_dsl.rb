class ProcessWithNewDsl
  include AASM

  def self.state(*_args)
    fail "wrong state method"
  end

  attr_accessor :flagged

  aasm do
    state :sleeping, initial: true
    state :running, after_enter: :flag
    state :suspended

    event :start do
      transitions from: :sleeping, to: :running
    end
    event :stop do
      transitions from: :running, to: :suspended
    end
  end

  def flag
    self.flagged = true
  end

  def self.event(*_args)
    fail "wrong event method"
  end
end

require 'active_record'

class Father < ActiveRecord::Base
  include AASM

  aasm do
    state :missing_details, initial: true
    state :pending_details_confirmation

    event :add_details do
      transitions from: :missing_details, to: :pending_details_confirmation
    end
  end

  def update_state
    add_details! if may_add_details?
  end
end

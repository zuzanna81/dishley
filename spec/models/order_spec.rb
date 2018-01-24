require 'rails_helper'

RSpec.describe Order, type: :model do
  it { is_expected.to respond_to :order_items }
  it { is_expected.to respond_to :add }

  describe 'states' do
    it { is_expected.to have_states :pending, :approved, :rejected }

    it { is_expected.to handle_events :payment_cleared, :payment_declined, when: :pending }

    it { is_expected.to transition_from :pending, to_state: :approved,
                                      on_event: :payment_cleared }

    it { is_expected.to transition_from :pending, to_state: :rejected,
                                    on_event: :payment_declined }

    it { is_expected.to reject_events :payment_cleared, when: :rejected }

    it { is_expected.to reject_events :payment_declined, when: :approved }
  end
end

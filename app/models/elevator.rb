require 'slack-notifier'

class Elevator < ApplicationRecord
    belongs_to :column
    belongs_to :customer

    around_update :notify_system_if_status_is_changed

    def notify_system_if_status_is_changed
        status_changed = self.status_changed?
        if status_changed
            notifier = Slack::Notifier.new Rails.application.credentials.slack[:token]
            notifier.ping "The elevator #{self.id} with serial number #{self.serial_number} changed status from #{self.status_was} to #{self.status}"
        end
        yield
    end
end
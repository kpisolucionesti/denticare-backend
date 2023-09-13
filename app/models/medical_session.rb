class MedicalSession < ApplicationRecord
    belongs_to :patient
    belongs_to :doctor
    belongs_to :room
end

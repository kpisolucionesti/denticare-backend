class Patient < ApplicationRecord
    has_one :medical_sessions
end

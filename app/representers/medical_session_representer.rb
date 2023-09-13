class MedicalSessionRepresenter < Representable::Decorator
    include Representable::JSON
    property :id
    property :patient_id
    property :check_in
    property :doctor_id
    property :room_id
    property :treatment_id
    property :status
end
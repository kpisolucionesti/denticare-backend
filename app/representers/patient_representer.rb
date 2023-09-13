class PatientRepresenter < Representable::Decorator
    include Representable::JSON
    property :id
    property :ci
    property :first_name
    property :last_name
    property :birth_date
    property :gender
    property :phone
    property :balance
end
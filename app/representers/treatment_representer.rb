class TreatmentRepresenter < Representable::Decorator
    include Representable::JSON
    property :id
    property :name
    property :amount
end
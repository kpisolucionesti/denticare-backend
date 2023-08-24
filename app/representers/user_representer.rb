class UserRepresenter < Representable::Decorator
    include Representable::JSON
    property :id
    property :ci
    property :name
    property :password
end
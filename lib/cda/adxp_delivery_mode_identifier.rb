class Cda::AdxpDeliveryModeIdentifier < Cda::ADXP
  attribute :part_type, Cda::AddressPartType, annotations: {:kind=>:attribute, :class=>"Cda::AddressPartType"}
end
class Cda::AdxpUnitID < Cda::ADXP
  attribute :part_type, Cda::AddressPartType, annotations: {:kind=>:attribute, :class=>"Cda::AddressPartType"}
  attribute :_text, String, annotations: {:class=>"String"}
end
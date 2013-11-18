class Cda::ObservationRange < Cda::Base
  attribute :realm_code, Array[Cda::CS], annotations: {:multiple=>true, :class=>"Cda::CS"}
  attribute :type_id, Cda::InfrastructureRootTypeId, annotations: {:class=>"Cda::InfrastructureRootTypeId"}
  attribute :template_id, Array[Cda::II], annotations: {:multiple=>true, :class=>"Cda::II"}
  attribute :code, Cda::CD, annotations: {:class=>"Cda::CD"}
  attribute :text, Cda::ED, annotations: {:class=>"Cda::ED"}
  attribute :value, Object, annotations: {:class=>"Object"}
  attribute :interpretation_code, Cda::CE, annotations: {:class=>"Cda::CE"}
  attribute :null_flavor, Cda::NullFlavor, annotations: {:use=>:optional, :kind=>:attribute, :class=>"Cda::NullFlavor"}
  attribute :class_code, Cda::ActClassObservation, annotations: {:use=>:optional, :kind=>:attribute, :class=>"Cda::ActClassObservation"}
  attribute :mood_code, Cda::ActMood, annotations: {:use=>:optional, :kind=>:attribute, :class=>"Cda::ActMood"}
end
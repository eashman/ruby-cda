class Cda::CD < Cda::ANY
  attribute :original_text, Cda::ED
  attribute :qualifier, Array[Cda::CR], annotations: {:multiple=>true}
  attribute :translation, Array[Cda::CD], annotations: {:multiple=>true}
  attribute :code, String, annotations: {:use=>:optional, :kind=>:attribute}
  attribute :code_system, String, annotations: {:use=>:optional, :kind=>:attribute}
  attribute :code_system_name, String, annotations: {:use=>:optional, :kind=>:attribute}
  attribute :code_system_version, String, annotations: {:use=>:optional, :kind=>:attribute}
  attribute :display_name, String, annotations: {:use=>:optional, :kind=>:attribute}
end

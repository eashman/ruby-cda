class Cda::Cs < String

end

class Cda::CS < Cda::CV
  attribute :code, Cda::Cs, annotations: {:kind=>:attribute, :class=>"Cda::Cs"}
  attribute :code_system, Cda::Uid, annotations: {:kind=>:attribute, :class=>"Cda::Uid"}
  attribute :code_system_name, Cda::St, annotations: {:kind=>:attribute, :class=>"Cda::St"}
  attribute :code_system_version, Cda::St, annotations: {:kind=>:attribute, :class=>"Cda::St"}
  attribute :display_name, Cda::St, annotations: {:kind=>:attribute, :class=>"Cda::St"}
  attribute :_text, String, annotations: {:kind=>:attribute, :class=>"String"}
end

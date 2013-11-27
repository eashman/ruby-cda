module Ccd::MedicalEquipmentSectionTemplate
  def self.included(base)
    base.class_eval do
      extend ::Ccd::Dsl
      
      # SHALL contain exactly one [1..1] templateId (CONF:7944) such that it
      constraint 'template_id', {:cardinality=>"1..1"}
      
      # SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.2.23" (CONF:10404).
      constraint 'template_id.root', {:cardinality=>"1..1", :value=>"2.16.840.1.113883.10.20.22.2.23"}
      
      # SHALL contain exactly one [1..1] code (CONF:15381).
      constraint 'code', {:cardinality=>"1..1", :value=>{:code=>"46264-8", :display_name=>"Medical Equipment", :code_system=>"2.16.840.1.113883.6.1"}}
      
      # SHALL contain exactly one [1..1] title (CONF:7946).
      constraint 'title', {:cardinality=>"1..1"}
      
      # SHALL contain exactly one [1..1] text (CONF:7947).
      constraint 'text', {:cardinality=>"1..1"}
    end
  end
end

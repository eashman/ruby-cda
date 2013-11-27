module Ccd::HospitalAdmissionMedicationsSectionTemplate
  def self.included(base)
    base.class_eval do
      extend ::Ccd::Dsl
      
      # SHALL contain exactly one [1..1] templateId (CONF:10098) such that it
      constraint 'template_id', {:cardinality=>"1..1"}
      
      # SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.2.44" (CONF:10392).
      constraint 'template_id.root', {:cardinality=>"1..1", :value=>"2.16.840.1.113883.10.20.22.2.44"}
      
      # SHALL contain exactly one [1..1] code (CONF:15482).
      constraint 'code', {:cardinality=>"1..1", :value=>{:code=>"42346-7", :display_name=>"Medications on Admission", :code_system=>"2.16.840.1.113883.6.1"}}
      
      # SHALL contain exactly one [1..1] title (CONF:10100).
      constraint 'title', {:cardinality=>"1..1"}
      
      # SHALL contain exactly one [1..1] text (CONF:10101).
      constraint 'text', {:cardinality=>"1..1"}
    end
  end
end

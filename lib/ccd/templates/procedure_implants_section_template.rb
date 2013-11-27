module Ccd::ProcedureImplantsSectionTemplate
  def self.included(base)
    base.class_eval do
      extend ::Ccd::Dsl
      
      # SHALL contain exactly one [1..1] templateId (CONF:8178) such that it
      constraint 'template_id', {:cardinality=>"1..1"}
      
      # SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.2.40" (CONF:10444).
      constraint 'template_id.root', {:cardinality=>"1..1", :value=>"2.16.840.1.113883.10.20.22.2.40"}
      
      # SHALL contain exactly one [1..1] code (CONF:15373).
      constraint 'code', {:cardinality=>"1..1", :value=>{:code=>"59771-6", :display_name=>"Procedure Implants"}}
      
      # This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.1" (CodeSystem: LOINC 2.16.840.1.113883.6.1) (CONF:26492).
      constraint 'code.code_system', {:cardinality=>"1..1", :value=>"2.16.840.1.113883.6.1"}
      
      # SHALL contain exactly one [1..1] title (CONF:8180).
      constraint 'title', {:cardinality=>"1..1"}
      
      # SHALL contain exactly one [1..1] text (CONF:8181).
      constraint 'text', {:cardinality=>"1..1"}
    end
  end
end

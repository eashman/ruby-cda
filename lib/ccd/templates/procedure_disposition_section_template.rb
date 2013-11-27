module Ccd::ProcedureDispositionSectionTemplate
  def self.included(base)
    base.class_eval do
      extend ::Ccd::Dsl
      
      # SHALL contain exactly one [1..1] templateId (CONF:8070) such that it
      constraint 'template_id', {:cardinality=>"1..1"}
      
      # SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.18.2.12" (CONF:10466).
      constraint 'template_id.root', {:cardinality=>"1..1", :value=>"2.16.840.1.113883.10.20.18.2.12"}
      
      # SHALL contain exactly one [1..1] code (CONF:15413).
      constraint 'code', {:cardinality=>"1..1", :value=>{:code=>"59775-7", :display_name=>"Procedure Disposition"}}
      
      # This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.1" (CodeSystem: LOINC 2.16.840.1.113883.6.1) (CONF:26490).
      constraint 'code.code_system', {:cardinality=>"1..1", :value=>"2.16.840.1.113883.6.1"}
      
      # SHALL contain exactly one [1..1] title (CONF:8072).
      constraint 'title', {:cardinality=>"1..1"}
      
      # SHALL contain exactly one [1..1] text (CONF:8073).
      constraint 'text', {:cardinality=>"1..1"}
    end
  end
end

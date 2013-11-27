module Ccd::ChiefComplaintAndReasonForVisitSTemplate
  def self.included(base)
    base.class_eval do
      extend ::Ccd::Dsl
      
      # SHALL contain exactly one [1..1] templateId (CONF:7840) such that it
      constraint 'template_id', {:cardinality=>"1..1"}
      
      # SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.2.13" (CONF:10383).
      constraint 'template_id.root', {:cardinality=>"1..1", :value=>"2.16.840.1.113883.10.20.22.2.13"}
      
      # SHALL contain exactly one [1..1] code (CONF:15449).
      constraint 'code', {:cardinality=>"1..1", :value=>{:code=>"46239-0", :display_name=>"Chief Complaint and Reason for Visit"}}
      
      # This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.1" (CodeSystem: LOINC 2.16.840.1.113883.6.1) (CONF:26473).
      constraint 'code.code_system', {:cardinality=>"1..1", :value=>"2.16.840.1.113883.6.1"}
      
      # SHALL contain exactly one [1..1] title (CONF:7842).
      constraint 'title', {:cardinality=>"1..1"}
      
      # SHALL contain exactly one [1..1] text (CONF:7843).
      constraint 'text', {:cardinality=>"1..1"}
    end
  end
end

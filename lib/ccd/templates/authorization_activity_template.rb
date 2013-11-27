module Ccd::AuthorizationActivityTemplate
  def self.included(base)
    base.class_eval do
      extend ::Ccd::Dsl
      
      # SHALL contain exactly one [1..1] @classCode="ACT" Act (CodeSystem: HL7ActClass 2.16.840.1.113883.5.6 STATIC) (CONF:8944).
      constraint 'class_code', {:cardinality=>"1..1", :value=>"ACT"}
      
      # SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: HL7ActClass 2.16.840.1.113883.5.6 STATIC) (CONF:8945).
      constraint 'mood_code', {:cardinality=>"1..1", :value=>"EVN"}
      
      # SHALL contain exactly one [1..1] templateId (CONF:8946) such that it
      constraint 'template_id', {:cardinality=>"1..1"}
      
      # SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.1.19" (CONF:10529).
      constraint 'template_id.root', {:cardinality=>"1..1", :value=>"2.16.840.1.113883.10.20.1.19"}
      
      # SHALL contain exactly one [1..1] id (CONF:8947).
      constraint 'id', {:cardinality=>"1..1"}
      
      # SHALL contain at least one [1..*] entryRelationship (CONF:8948) such that it
      constraint 'entry_relationship', {:cardinality=>"1..*"}
      
      # SHALL contain exactly one [1..1] @typeCode="SUBJ" Has Subject (CodeSystem: HL7ActRelationshipType 2.16.840.1.113883.5.1002 STATIC) (CONF:8949).
      constraint 'entry_relationship.type_code', {:cardinality=>"1..1", :value=>"SUBJ"}
    end
  end
end

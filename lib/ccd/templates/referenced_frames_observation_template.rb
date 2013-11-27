module Ccd::ReferencedFramesObservationTemplate
  def self.included(base)
    base.class_eval do
      extend ::Ccd::Dsl
      
      # SHALL contain exactly one [1..1] @classCode="ROIBND" Bounded Region of Interest (CodeSystem: HL7ActClass 2.16.840.1.113883.5.6 STATIC) (CONF:9276).
      constraint 'class_code', {:cardinality=>"1..1", :value=>"ROIBND"}
      
      # SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood 2.16.840.1.113883.5.1001 STATIC) (CONF:9277).
      constraint 'mood_code', {:cardinality=>"1..1", :value=>"EVN"}
      
      # SHALL contain exactly one [1..1] code (CONF:19164).
      constraint 'code', {:cardinality=>"1..1"}
      
      # SHALL contain exactly one [1..1] entryRelationship (CONF:9279).
      constraint 'entry_relationship', {:cardinality=>"1..1"}
      
      # This entryRelationship SHALL contain exactly one [1..1] @typeCode="COMP" Component (CodeSystem: HL7ActRelationshipType 2.16.840.1.113883.5.1002 STATIC) (CONF:9280).
      constraint 'entry_relationship.type_code', {:cardinality=>"1..1", :value=>"COMP"}
      
      # This entryRelationship SHALL contain exactly one [1..1] Boundary Observation (templateId:2.16.840.1.113883.10.20.6.2.11) (CONF:15923).
      constraint 'entry_relationship.observation', {:cardinality=>"1..1"}
    end
  end
end

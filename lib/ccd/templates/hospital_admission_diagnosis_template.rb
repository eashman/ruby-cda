module Ccd::HospitalAdmissionDiagnosisTemplate
  def self.included(base)
    base.class_eval do
      extend ::Ccd::Dsl
      
      # SHALL contain exactly one [1..1] @classCode="ACT" (CodeSystem: HL7ActClass 2.16.840.1.113883.5.6 STATIC) (CONF:7671).
      constraint 'class_code', {:cardinality=>"1..1", :value=>"ACT"}
      
      # SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood 2.16.840.1.113883.5.1001 STATIC) (CONF:7672).
      constraint 'mood_code', {:cardinality=>"1..1", :value=>"EVN"}
      
      # SHALL contain exactly one [1..1] templateId (CONF:16747) such that it
      constraint 'template_id', {:cardinality=>"1..1"}
      
      # SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.4.34" (CONF:16748).
      constraint 'template_id.root', {:cardinality=>"1..1", :value=>"2.16.840.1.113883.10.20.22.4.34"}
      
      # SHALL contain exactly one [1..1] code (CONF:19145).
      constraint 'code', {:cardinality=>"1..1", :value=>{:code=>"46241-6", :display_name=>"Admission diagnosis", :code_system=>"2.16.840.1.113883.6.1"}}
      
      # SHALL contain at least one [1..*] entryRelationship (CONF:7674) such that it
      constraint 'entry_relationship', {:cardinality=>"1..*"}
      
      # SHALL contain exactly one [1..1] @typeCode="SUBJ" Has Subject (CodeSystem: HL7ActRelationshipType 2.16.840.1.113883.5.1002 STATIC) (CONF:7675).
      constraint 'entry_relationship.type_code', {:cardinality=>"1..1", :value=>"SUBJ"}
      
      # SHALL contain exactly one [1..1] Problem Observation (templateId:2.16.840.1.113883.10.20.22.4.4) (CONF:15535).
      constraint 'entry_relationship.observation', {:cardinality=>"1..1"}
    end
  end
end

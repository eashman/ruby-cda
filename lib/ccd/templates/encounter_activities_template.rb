module Ccd::EncounterActivitiesTemplate
  def self.included(base)
    base.class_eval do
      extend ::Ccd::Dsl
      
      # SHALL contain exactly one [1..1] @classCode="ENC" (CodeSystem: HL7ActClass 2.16.840.1.113883.5.6 STATIC) (CONF:8710).
      constraint 'class_code', {:cardinality=>"1..1", :value=>"ENC"}
      
      # SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood 2.16.840.1.113883.5.1001 STATIC) (CONF:8711).
      constraint 'mood_code', {:cardinality=>"1..1", :value=>"EVN"}
      
      # SHALL contain exactly one [1..1] templateId (CONF:8712) such that it
      constraint 'template_id', {:cardinality=>"1..1"}
      
      # SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.4.49" (CONF:26353).
      constraint 'template_id.root', {:cardinality=>"1..1", :value=>"2.16.840.1.113883.10.20.22.4.49"}
      
      # SHALL contain at least one [1..*] id (CONF:8713).
      constraint 'id', {:cardinality=>"1..*"}
      
      # SHALL contain exactly one [1..1] effectiveTime (CONF:8715).
      constraint 'effective_time', {:cardinality=>"1..1"}
    end
  end
end

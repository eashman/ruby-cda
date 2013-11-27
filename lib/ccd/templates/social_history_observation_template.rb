module Ccd::SocialHistoryObservationTemplate
  def self.included(base)
    base.class_eval do
      extend ::Ccd::Dsl
      
      # SHALL contain exactly one [1..1] @classCode="OBS" Observation (CodeSystem: HL7ActClass 2.16.840.1.113883.5.6 STATIC) (CONF:8548).
      constraint 'class_code', {:cardinality=>"1..1", :value=>"OBS"}
      
      # SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood 2.16.840.1.113883.5.1001 STATIC) (CONF:8549).
      constraint 'mood_code', {:cardinality=>"1..1", :value=>"EVN"}
      
      # SHALL contain exactly one [1..1] templateId (CONF:8550) such that it
      constraint 'template_id', {:cardinality=>"1..1"}
      
      # SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.4.38" (CONF:10526).
      constraint 'template_id.root', {:cardinality=>"1..1", :value=>"2.16.840.1.113883.10.20.22.4.38"}
      
      # SHALL contain at least one [1..*] id (CONF:8551).
      constraint 'id', {:cardinality=>"1..*"}
      
      # SHALL contain exactly one [1..1] code (CONF:8558).
      constraint 'code', {:cardinality=>"1..1"}
      
      # SHALL contain exactly one [1..1] statusCode (CONF:8553).
      constraint 'status_code', {:cardinality=>"1..1", :value=>{:code=>"completed", :display_name=>"Completed", :code_system=>"2.16.840.1.113883.5.14"}}
    end
  end
end

module Ccd::CodeObservationsTemplate
  def self.included(base)
    base.class_eval do
      extend ::Ccd::Dsl
      
      # SHALL contain exactly one [1..1] @classCode="OBS" Observation (CodeSystem: HL7ActClass 2.16.840.1.113883.5.6 STATIC) (CONF:9304).
      constraint 'class_code', {:cardinality=>"1..1", :value=>"OBS"}
      
      # SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood 2.16.840.1.113883.5.1001 STATIC) (CONF:9305).
      constraint 'mood_code', {:cardinality=>"1..1", :value=>"EVN"}
      
      # SHALL contain exactly one [1..1] templateId (CONF:15523).
      constraint 'template_id', {:cardinality=>"1..1"}
      
      # This templateId SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.6.2.13" (CONF:15524).
      constraint 'template_id.root', {:cardinality=>"1..1", :value=>"2.16.840.1.113883.10.20.6.2.13"}
      
      # SHALL contain exactly one [1..1] code (CONF:19181).
      constraint 'code', {:cardinality=>"1..1"}
      
      # SHALL contain exactly one [1..1] value (CONF:9308).
      constraint 'value', {:cardinality=>"1..1"}
    end
  end
end

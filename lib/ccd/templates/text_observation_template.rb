module Ccd::TextObservationTemplate
  def self.included(base)
    base.class_eval do
      extend ::Ccd::Dsl
      
      # SHALL contain exactly one [1..1] @classCode="OBS" Observation (CodeSystem: ActCode 2.16.840.1.113883.5.4 STATIC) (CONF:9288).
      constraint 'class_code', {:cardinality=>"1..1", :value=>"OBS"}
      
      # SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood 2.16.840.1.113883.5.1001 STATIC) (CONF:9289).
      constraint 'mood_code', {:cardinality=>"1..1", :value=>"EVN"}
      
      # SHALL contain exactly one [1..1] templateId (CONF:9290) such that it
      constraint 'template_id', {:cardinality=>"1..1"}
      
      # SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.6.2.12" (CONF:10534).
      constraint 'template_id.root', {:cardinality=>"1..1", :value=>"2.16.840.1.113883.10.20.6.2.12"}
      
      # SHALL contain exactly one [1..1] code (CONF:9291).
      constraint 'code', {:cardinality=>"1..1"}
      
      # SHALL contain exactly one [1..1] value with @xsi:type="ED" (CONF:9292).
      constraint 'value', {:cardinality=>"1..1"}
    end
  end
end

module Ccd::PregnancyObservationTemplate
  def self.included(base)
    base.class_eval do
      extend ::Ccd::Dsl
      
      # SHALL contain exactly one [1..1] @classCode="OBS" Observation (CodeSystem: HL7ActClass 2.16.840.1.113883.5.6 STATIC) (CONF:451).
      constraint 'class_code', {:cardinality=>"1..1", :value=>"OBS"}
      
      # SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood 2.16.840.1.113883.5.1001 STATIC) (CONF:452).
      constraint 'mood_code', {:cardinality=>"1..1", :value=>"EVN"}
      
      # SHALL contain exactly one [1..1] templateId (CONF:16768) such that it
      constraint 'template_id', {:cardinality=>"1..1"}
      
      # SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.15.3.8" (CONF:16868).
      constraint 'template_id.root', {:cardinality=>"1..1", :value=>"2.16.840.1.113883.10.20.15.3.8"}
      
      # SHALL contain exactly one [1..1] code (CONF:19153).
      constraint 'code', {:cardinality=>"1..1", :value=>{:code=>"ASSERTION", :display_name=>"Assertion"}}
      
      # This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.5.4" (CodeSystem: ActCode 2.16.840.1.113883.5.4) (CONF:26505).
      constraint 'code.code_system', {:cardinality=>"1..1", :value=>"2.16.840.1.113883.5.4"}
      
      # SHALL contain exactly one [1..1] statusCode (CONF:455).
      constraint 'status_code', {:cardinality=>"1..1", :value=>{:code=>"completed", :display_name=>"Completed", :code_system=>"2.16.840.1.113883.5.14"}}
      
      # SHALL contain exactly one [1..1] value with @xsi:type="CD" (CONF:457).
      constraint 'value', {:cardinality=>"1..1", :value=>{:code=>"77386006", :display_name=>"Pregnant", :code_system=>"2.16.840.1.113883.6.96"}}
    end
  end
end

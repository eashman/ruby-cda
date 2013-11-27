module Ccd::TobaccoUseTemplate
  def self.included(base)
    base.class_eval do
      extend ::Ccd::Dsl
      
      # SHALL contain exactly one [1..1] @classCode="OBS" Observation (CodeSystem: HL7ActClass 2.16.840.1.113883.5.6 STATIC) (CONF:16558).
      constraint 'class_code', {:cardinality=>"1..1", :value=>"OBS"}
      
      # SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood 2.16.840.1.113883.5.1001 STATIC) (CONF:16559).
      constraint 'mood_code', {:cardinality=>"1..1", :value=>"EVN"}
      
      # SHALL contain exactly one [1..1] templateId (CONF:16566) such that it
      constraint 'template_id', {:cardinality=>"1..1"}
      
      # SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.4.85" (CONF:16567).
      constraint 'template_id.root', {:cardinality=>"1..1", :value=>"2.16.840.1.113883.10.20.22.4.85"}
      
      # SHALL contain exactly one [1..1] code (CONF:19174).
      constraint 'code', {:cardinality=>"1..1", :value=>{:code=>"ASSERTION", :display_name=>"Assertion", :code_system=>"2.16.840.1.113883.5.4"}}
      
      # SHALL contain exactly one [1..1] statusCode (CONF:16561).
      constraint 'status_code', {:cardinality=>"1..1", :value=>{:code=>"completed", :display_name=>"Completed", :code_system=>"2.16.840.1.113883.5.14"}}
      
      # SHALL contain exactly one [1..1] effectiveTime (CONF:16564).
      constraint 'effective_time', {:cardinality=>"1..1"}
      
      # This effectiveTime SHALL contain exactly one [1..1] low (CONF:16565).
      constraint 'effective_time.low', {:cardinality=>"1..1"}
      
      # SHALL contain exactly one [1..1] value with @xsi:type="CD" (CONF:16562).
      constraint 'value', {:cardinality=>"1..1"}
      
      # This value SHALL contain exactly one [1..1] @code, which SHALL be selected from ValueSet Tobacco Use 2.16.840.1.113883.11.20.9.41 DYNAMIC (CONF:16563).
      constraint 'value.code', {:cardinality=>"1..1"}
    end
  end
end

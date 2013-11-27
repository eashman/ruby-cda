module Ccd::ImmunizationRefusalReasonTemplate
  def self.included(base)
    base.class_eval do
      extend ::Ccd::Dsl
      
      # SHALL contain exactly one [1..1] @classCode="OBS" Observation (CodeSystem: HL7ActClass 2.16.840.1.113883.5.6 STATIC) (CONF:8991).
      constraint 'class_code', {:cardinality=>"1..1", :value=>"OBS"}
      
      # SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood 2.16.840.1.113883.5.1001 STATIC) (CONF:8992).
      constraint 'mood_code', {:cardinality=>"1..1", :value=>"EVN"}
      
      # SHALL contain exactly one [1..1] templateId (CONF:8993) such that it
      constraint 'template_id', {:cardinality=>"1..1"}
      
      # SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.4.53" (CONF:10500).
      constraint 'template_id.root', {:cardinality=>"1..1", :value=>"2.16.840.1.113883.10.20.22.4.53"}
      
      # SHALL contain at least one [1..*] id (CONF:8994).
      constraint 'id', {:cardinality=>"1..*"}
      
      # SHALL contain exactly one [1..1] code, which SHALL be selected from ValueSet No Immunization Reason Value Set 2.16.840.1.113883.1.11.19717 DYNAMIC (CONF:8995).
      constraint 'code', {:cardinality=>"1..1"}
      
      # SHALL contain exactly one [1..1] statusCode (CONF:8996).
      constraint 'status_code', {:cardinality=>"1..1", :value=>{:code=>"completed", :display_name=>"Completed", :code_system=>"2.16.840.1.113883.5.14"}}
    end
  end
end

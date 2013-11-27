module Ccd::MedicationDispenseTemplate
  def self.included(base)
    base.class_eval do
      extend ::Ccd::Dsl
      
      # SHALL contain exactly one [1..1] @classCode="SPLY" (CodeSystem: HL7ActClass 2.16.840.1.113883.5.6 STATIC) (CONF:7451).
      constraint 'class_code', {:cardinality=>"1..1", :value=>"SPLY"}
      
      # SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood 2.16.840.1.113883.5.1001 STATIC) (CONF:7452).
      constraint 'mood_code', {:cardinality=>"1..1", :value=>"EVN"}
      
      # SHALL contain exactly one [1..1] templateId (CONF:7453) such that it
      constraint 'template_id', {:cardinality=>"1..1"}
      
      # SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.4.18" (CONF:10505).
      constraint 'template_id.root', {:cardinality=>"1..1", :value=>"2.16.840.1.113883.10.20.22.4.18"}
      
      # SHALL contain at least one [1..*] id (CONF:7454).
      constraint 'id', {:cardinality=>"1..*"}
      
      # SHALL contain exactly one [1..1] statusCode, which SHALL be selected from ValueSet Medication Fill Status 2.16.840.1.113883.3.88.12.80.64 DYNAMIC (CONF:7455).
      constraint 'status_code', {:cardinality=>"1..1"}
    end
  end
end

module Ccd
  class DeceasedObservation < ::Cda::Observation
    extend ::Ccd::Dsl
    #SHALL contain exactly one [1..1] @classCode="OBS" Observation (CodeSystem: HL7ActClass 2.16.840.1.113883.5.6 STATIC) (CONF:14851).
    constraint 'class_code', {:cardinality=>"1..1", :value=>"OBS"}

    #SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood 2.16.840.1.113883.5.1001 STATIC) (CONF:14852).
    constraint 'mood_code', {:cardinality=>"1..1", :value=>"EVN"}

    #SHALL contain exactly one [1..1] templateId (CONF:14871) such that it
    constraint 'template_id', {:cardinality=>"1..1"}

    #SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.4.79" (CONF:14872).
    constraint 'template_id.root', {:cardinality=>"1..1", :value=>"2.16.840.1.113883.10.20.22.4.79"}

    #SHALL contain at least one [1..*] id (CONF:14873).
    constraint 'id', {:cardinality=>"1..*"}

    #SHALL contain exactly one [1..1] code (CONF:14853).
    constraint 'code', {:cardinality=>"1..1"}

    #This code SHALL contain exactly one [1..1] @code="ASSERTION" Assertion (CodeSystem: ActCode 2.16.840.1.113883.5.4 STATIC) (CONF:19135).
    constraint 'code.code', {:cardinality=>"1..1", :value=>"ASSERTION"}

    #SHALL contain exactly one [1..1] statusCode (CONF:14854).
    constraint 'status_code', {:cardinality=>"1..1"}

    #This statusCode SHALL contain exactly one [1..1] @code="completed" Completed (CodeSystem: ActStatus 2.16.840.1.113883.5.14 STATIC) (CONF:19095).
    constraint 'status_code.code', {:cardinality=>"1..1", :value=>"completed"}

    #SHALL contain exactly one [1..1] effectiveTime (CONF:14855).
    constraint 'effective_time', {:cardinality=>"1..1"}

    #This effectiveTime SHALL contain exactly one [1..1] low (CONF:14874).
    constraint 'effective_time.low', {:cardinality=>"1..1"}

    #SHALL contain exactly one [1..1] value with @xsi:type="CD" (CONF:14857).
    constraint 'value', {:cardinality=>"1..1"}

    #This value SHALL contain exactly one [1..1] @code="419099009" Dead (CodeSystem: SNOMED CT 2.16.840.1.113883.6.96 STATIC) (CONF:15142).
    constraint 'value.code', {:cardinality=>"1..1", :value=>"419099009"}

    #SHOULD contain zero or one [0..1] entryRelationship (CONF:14868) such that it
    constraint 'entry_relationship', {:cardinality=>"0..1"}

    #SHALL contain exactly one [1..1] @typeCode="CAUS" Is etiology for (CodeSystem: HL7ActRelationshipType 2.16.840.1.113883.5.1002 STATIC) (CONF:14875).
    constraint 'entry_relationship.type_code', {:cardinality=>"1..1", :value=>"CAUS"}

    #SHALL contain exactly one [1..1] Problem Observation (templateId:2.16.840.1.113883.10.20.22.4.4) (CONF:14870).
    constraint 'entry_relationship.observation', {:cardinality=>"1..1"}

    Ccd.load_extension('deceased_observation.rb')
  end
end

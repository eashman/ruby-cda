module Ccd
  class ProblemConcernActCondition < ::Cda::Act
    include Virtus.model
    extend ::Ccd::Dsl
    #SHALL contain exactly one [1..1] @classCode="ACT" Act (CodeSystem: HL7ActClass 2.16.840.1.113883.5.6 STATIC) (CONF:9024).
    constraint 'class_code', cardinality: '1..1', value: 'ACT'

    #SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood 2.16.840.1.113883.5.1001 STATIC) (CONF:9025).
    constraint 'mood_code', cardinality: '1..1', value: 'EVN'

    #SHALL contain exactly one [1..1] templateId (CONF:16772) such that it
    constraint 'template_id', cardinality: '1..1'

    #SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.4.3" (CONF:16773).
    constraint 'template_id.root', cardinality: '1..1', value: '2.16.840.1.113883.10.20.22.4.3'

    #SHALL contain at least one [1..*] id (CONF:9026).
    constraint 'id', cardinality: '1..*'

    #SHALL contain exactly one [1..1] code (CONF:9027).
    constraint 'code', cardinality: '1..1'

    #This code SHALL contain exactly one [1..1] @code="CONC" Concern (CodeSystem: HL7ActClass 2.16.840.1.113883.5.6 STATIC) (CONF:19184).
    constraint 'code.code', cardinality: '1..1', value: 'CONC'

    #SHALL contain exactly one [1..1] statusCode, which SHALL be selected from ValueSet ProblemAct statusCode 2.16.840.1.113883.11.20.9.19 STATIC 2011-09-09 (CONF:9029).
    constraint 'status_code', cardinality: '1..1'

    #SHALL contain exactly one [1..1] effectiveTime (CONF:9030).
    constraint 'effective_time', cardinality: '1..1'

    #This effectiveTime SHALL contain exactly one [1..1] low (CONF:9032).
    constraint 'effective_time.low', cardinality: '1..1'

    #This effectiveTime SHOULD contain zero or one [0..1] high (CONF:9033).
    constraint 'effective_time.high', cardinality: '0..1'

    #SHALL contain at least one [1..*] entryRelationship (CONF:9034) such that it
    constraint 'entry_relationship', cardinality: '1..*'

    #SHALL contain exactly one [1..1] @typeCode="SUBJ" Has subject (CodeSystem: HL7ActRelationshipType 2.16.840.1.113883.5.1002 STATIC) (CONF:9035).
    constraint 'entry_relationship.type_code', cardinality: '1..1', value: 'SUBJ'

    #SHALL contain exactly one [1..1] Problem Observation (templateId:2.16.840.1.113883.10.20.22.4.4) (CONF:15980).
    constraint 'entry_relationship.observation', cardinality: '1..1'

    Ccd.load_extension('problem_concern_act_condition.rb')
  end
end
module Ccd
  class ObjectiveSection < ::Cda::Section
    include Virtus.model
    extend ::Ccd::Dsl
    #SHALL contain exactly one [1..1] templateId (CONF:7869) such that it
    constraint 'templateId', cardinality: '1..1'

    #SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.21.2.1" (CONF:10462).
    constraint 'templateId.root', cardinality: '1..1', value: '2.16.840.1.113883.10.20.21.2.1'

    #SHALL contain exactly one [1..1] code (CONF:15389).
    constraint 'code', cardinality: '1..1'

    #This code SHALL contain exactly one [1..1] @code="61149-1" Objective (CONF:15390).
    constraint 'code.code', cardinality: '1..1', value: '61149-1'

    #This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.1" (CodeSystem: LOINC 2.16.840.1.113883.6.1) (CONF:26485).
    constraint 'code.codeSystem', cardinality: '1..1', value: '2.16.840.1.113883.6.1'

    #SHALL contain exactly one [1..1] title (CONF:7871).
    constraint 'title', cardinality: '1..1'

    #SHALL contain exactly one [1..1] text (CONF:7872).
    constraint 'text', cardinality: '1..1'
  end
end
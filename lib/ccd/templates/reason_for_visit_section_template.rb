module Ccd::ReasonForVisitSectionTemplate
  def self.included(base)
    base.class_eval do
      extend ::Ccd::Dsl
      
      # SHALL contain exactly one [1..1] templateId (CONF:7836) such that it
      constraint 'template_id', {:cardinality=>"1..1"}
      
      # SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.2.12" (CONF:10448).
      constraint 'template_id.root', {:cardinality=>"1..1", :value=>"2.16.840.1.113883.10.20.22.2.12"}
      
      # SHALL contain exactly one [1..1] code (CONF:15429).
      constraint 'code', {:cardinality=>"1..1", :value=>{:code=>"29299-5", :display_name=>"Reason for Visit"}}
      
      # This code SHALL contain exactly one [1..1] @codeSystem (CONF:26494).
      constraint 'code.code_system', {:cardinality=>"1..1"}
      
      # SHALL contain exactly one [1..1] title (CONF:7838).
      constraint 'title', {:cardinality=>"1..1"}
      
      # SHALL contain exactly one [1..1] text (CONF:7839).
      constraint 'text', {:cardinality=>"1..1"}
    end
  end
end

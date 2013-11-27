module Ccd::PhysicalExamSectionTemplate
  def self.included(base)
    base.class_eval do
      extend ::Ccd::Dsl
      
      # SHALL contain exactly one [1..1] templateId (CONF:7806) such that it
      constraint 'template_id', {:cardinality=>"1..1"}
      
      # SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.2.10" (CONF:10465).
      constraint 'template_id.root', {:cardinality=>"1..1", :value=>"2.16.840.1.113883.10.20.2.10"}
      
      # SHALL contain exactly one [1..1] code (CONF:15397).
      constraint 'code', {:cardinality=>"1..1", :value=>{:code=>"29545-1", :display_name=>"Physical Findings", :code_system=>"2.16.840.1.113883.6.1"}}
      
      # SHALL contain exactly one [1..1] title (CONF:7808).
      constraint 'title', {:cardinality=>"1..1"}
      
      # SHALL contain exactly one [1..1] text (CONF:7809).
      constraint 'text', {:cardinality=>"1..1"}
    end
  end
end

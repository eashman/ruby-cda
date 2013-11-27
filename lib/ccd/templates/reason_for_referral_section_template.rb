module Ccd::ReasonForReferralSectionTemplate
  def self.included(base)
    base.class_eval do
      extend ::Ccd::Dsl
      
      # SHALL contain exactly one [1..1] templateId (CONF:7844) such that it
      constraint 'template_id', {:cardinality=>"1..1"}
      
      # SHALL contain exactly one [1..1] @root="1.3.6.1.4.1.19376.1.5.3.1.3.1" (CONF:10468).
      constraint 'template_id.root', {:cardinality=>"1..1", :value=>"1.3.6.1.4.1.19376.1.5.3.1.3.1"}
      
      # SHALL contain exactly one [1..1] code (CONF:15427).
      constraint 'code', {:cardinality=>"1..1", :value=>{:code=>"42349-1", :display_name=>"Reason for Referral", :code_system=>"2.16.840.1.113883.6.1"}}
      
      # SHALL contain exactly one [1..1] title (CONF:7846).
      constraint 'title', {:cardinality=>"1..1"}
      
      # SHALL contain exactly one [1..1] text (CONF:7847).
      constraint 'text', {:cardinality=>"1..1"}
    end
  end
end

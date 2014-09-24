module Cda::VidaguardEntities
  class CdaVidaguardInstanceIdentifier
    include Virtus.model
    attribute :root, String, annotations: { :kind=>:attribute }
  end

  class CdaVidaguardModel
    include Virtus.model

    attribute :template_id, Array[CdaVidaguardInstanceIdentifier]
    attribute :title, String

    def self.template_type
      'ClinicalDocument'
    end
  end

  def self.included(base)
    base.class_eval do
      let(:registry) {
        Cda::TemplatesRegistry
          .new('2.16.840.1.113883.10.20.22.1.1' => CdaVidaguardModel)
      }
    end
  end
end

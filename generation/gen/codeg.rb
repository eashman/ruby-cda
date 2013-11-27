module Gen
  module Codeg
    def gklass(name, opts = {})
      module_name = opts[:module]
      ancestor = opts[:ancestor]
      body = opts[:body]

      content = []
      content << "class #{name}"
      ancestor ||= 'Cda::Base'
      content.last << " < #{ancestor}"
      if body.present?
        content << indent(body, 2)
      elsif block_given?
        content << yield(2)
      end
      content << 'end'
      if module_name.present?
        content = content.map { |row| indent(row, 2) }
        content.unshift("module #{module_name}")
        content.push('end')
      end
      content.join("\n").split("\n").map { |s| s.rstrip }.join("\n")
    end

    def stdlib_type?(type)
      Object.constants.include?(type.try :to_sym) || type == 'Boolean'
    end

    def gmodule(name, body)
      content = []
      content << "module #{name}"
      content << indent(body, 2)
      content << 'end'
      content.join("\n")
    end

    def to_prefix_type(type_name)
      if stdlib_type?(type_name)
        type_name
      else
        'Cda::' + type_name
      end
    end

    def generate_attribute(aname, type, opts)
      if type == 'ANY'
        type = 'Object'
      end
      unless type.start_with?('Array')
        type = to_prefix_type(type)
      end

      if opts.delete :multiple
        type = "Array[#{type}]"
      end

      res = []
      comment = opts.delete(:comment)
      res << "# #{comment.gsub(/\s+$/, '')}" if comment.present?

      attr = [
        "attribute :#{Namings.normalize_name(aname)}",
        type,
        hash_to_str(opts).presence
      ]
      res << attr.compact.join(', ')
      res.join("\n")
    end

    def gmethod(method_name, args, body)
      definition = "def #{method_name}"
      definition << "(#{args.join(', ')})" if args.present?
      gblock(definition, body)
    end

    def gblock(starts_with, body, ends_with='end')
      [starts_with, indent(body, 2), ends_with].join("\n")
    end

    private

    def indent(str, size)
      str.split("\n")
      .map { |s| (' ' * size) + s }
      .join("\n")
    end

    def hash_to_str(hash)
      hash.map { |k, v| "#{k}: #{v.inspect}" }.join(', ')
    end

    extend self
  end
end

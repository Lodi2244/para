module Para
  module FormHelper
    def para_form_for(resource, options = {}, &block)
      default_options = {
        as: :resource,
        wrapper: :horizontal_form,
        html: { class: 'form-horizontal form-group-separated' }
      }

      options = default_options.deep_merge(options)

      unless options.key?(:url)
        options[:url] = @component.relation_path(resource)
      end

      simple_form_for(resource, options, &block)
    end
  end
end

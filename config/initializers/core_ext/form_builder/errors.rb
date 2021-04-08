class ActionView::Helpers::FormBuilder
  def errors(field_name)
    if self.object.errors[field_name].present?
      model_name = self.object.class.name.downcase
      id = "error_#{model_name}_#{field_name}"
      parent_id = "#{model_name}_#{field_name}"
      string = %{
        <label id=#{id} for="#{parent_id}" class="field_with_errors">
          #{self.object.errors[field_name].join(', ')}
        </label>
      }
      string.squish.html_safe
    end
  end
end
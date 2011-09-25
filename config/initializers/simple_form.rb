SimpleForm.setup do |config|
  config.wrappers :class => 'clearfix', :error_class => :error do |b|
    b.use :placeholder
    b.use :label
    b.use :tag => 'div', :class => 'input' do |ba|
      ba.use :input, :class => 'xxlarge'
      ba.use :hint,  :tag => :div, :class => 'help-block'
      ba.use :error, :tag => :span, :class => 'help-inline'
    end
  end

  config.browser_validations = false
  config.button_class = 'btn'
end


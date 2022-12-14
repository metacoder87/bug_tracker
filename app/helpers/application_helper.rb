module ApplicationHelper

    def flash_notice(flash)
        capture do
            flash.each do |type, message|
                concat content_tag :div, message, class: "alert alert-#{flash_class(type)}", role: "alert"
            end
        end
    end

    def flash_class(type)
        {'notice' => 'success',
         'error' => 'danger',
         'alert' => 'info'
        }[type]
    end

    def bootstrap_devise_error_messages!
        return '' if resource.errors.empty?

        messages = resource.errors.full_messages.map { |message| content_tag(:li, message) }.join
        sentence = I18n.t(
            'errors.messages.not_saved',
            count: resource.errors.count,
            resource: resource.class.model_name.human.downcase
        )

        html = <<-HTML
        <div class="alert alert-danger">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
            <h4 class="alert-heading">#{sentence}</h4>
            <ul class="mb-0">#{messages}</ul>
        </div>
        HTML

        html.html_safe
    end
end

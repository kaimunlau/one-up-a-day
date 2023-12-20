module ApplicationHelper
  def filter_button_link_to(text, path)
    link_to text, path,
            class: "transition-all px-3 py-1 text-xs text-gray-600 rounded-full #{current_page?(path) ? 'bg-primary font-semibold text-white' : 'bg-accent hover:shadow-md'}"
  end
end

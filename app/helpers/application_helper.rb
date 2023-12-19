module ApplicationHelper
  def filter_button_link_to(text, path)
    link_to text, path,
            class: "px-2 py-1 text-xs text-gray-600 bg-gray-200 rounded-full #{current_page?(path) ? 'bg-gray-400 font-semibold text-white' : ''}"
  end
end

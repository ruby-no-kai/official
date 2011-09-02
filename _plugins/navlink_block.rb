module Jekyll
  class NavlinkBlock < Liquid::Block
    def initialize(tag_name, text, tokens)
      super
      @href = text.strip
    end

    def render(context)
      current_url = context['page.url']
      klass = (current_url == @href) ? ' class="selected"' : ''
      %|<li%s><a href="%s">%s</a>| % [klass, @href, super.join]
    end
  end
end

Liquid::Template.register_tag('navlink', Jekyll::NavlinkBlock)

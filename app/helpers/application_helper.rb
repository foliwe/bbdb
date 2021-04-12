module ApplicationHelper
  include Pagy::Frontend

  def default_meta_tags
    {
      site:       ' GLOBAL BBDATABASE',
      keywords: 'Black Power,Black Panther, black wealth ,Black Wall street , Black Business , Black Companies , Black Billionaires, BLM',
      separator:   "&mdash;".html_safe,
    }
  end
end

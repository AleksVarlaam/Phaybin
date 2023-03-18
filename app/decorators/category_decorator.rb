class CategoryDecorator < Draper::Decorator
  delegate_all

  def title
    case I18n.locale
    when :ru then category.ru
    when :uk then category.uk
    when :en then category.en
    when :he then category.he
    end
  end

end

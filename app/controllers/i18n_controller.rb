class I18nController < ApplicationController
  def index
    lang = get_params
    # if lang == 'en'
    I18n.default_locale = lang
    # I18n.locale = lang || I18n.default_locale
    redirect_to :back
  end
  
  private
  def get_params
    params[:lang]
  end
end

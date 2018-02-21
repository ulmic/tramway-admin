module Tramway::Admin::SingletonHelper
  # FIXME replace to module
  def singleton_path(*args, **options)
    super args, options.merge(model: params[:model])
  end

  def edit_singleton_path(*args, **options)
    super args, options.merge(model: params[:model])
  end
end

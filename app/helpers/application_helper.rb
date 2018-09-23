module ApplicationHelper
  def present(object)
    presenter_class_const = "#{object.class}Presenter".constantize
    # self is the context where 'present' is called (typically the view)
    presenter = presenter_class_const.new(object, self)
    # in a view, you typically pass a block to present(object) so that the presenter built here is yielded
    # to the block itself (the code making up the view itself)
    if block_given?
      yield(presenter)
    else
      # if a block is not given, it makes sense to return the presenter itself
      presenter
    end
  end
end

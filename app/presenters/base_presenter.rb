class BasePresenter
  # could inherit from SimpleDelegator to automatically delegate methods to the passed model
  def initialize(object, view)
    @object = object
    @view = view
  end

  # allows to call the object with the presented class name (hotel, user, ...) instead of '@object'
  def self.presents(obj_class_name_sym)
    define_method(obj_class_name_sym) { @object }
  end

  private

  # allows to access the view context (and use its helpers) from the children presenters
  # 'h' is the notation used by the popular Draper gem
  def h
    @view
  end

  # any missing method (usually helpers) is delegated to the view context
  def method_missing(*args, &block)
    @view.send(*args, &block)
  end
end

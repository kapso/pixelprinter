class Shop < ActiveRecord::Base
  has_many :templates, :class_name => "PrintTemplate"

  after_create :create_base_templates


  private
  
  # Create 3 templates as a starting point for the user
  def create_base_templates
    templates.new.from_file(:invoice)
    # TODO: add another default template and put it in the correct folder
    templates.new.from_file("../../test/fixtures/example_print_template")
  end
end

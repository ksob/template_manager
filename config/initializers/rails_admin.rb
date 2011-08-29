RailsAdmin.config do |c|
  c.authorize_with :cancan
  
  c.model FormTemplate do
    edit do
      field :name, :string do
      end
      field :description, :text do
      end
      field :contents, :text do
        ckeditor true
      end
    end
  end
end

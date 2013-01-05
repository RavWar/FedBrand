#coding: utf-8
ActiveAdmin.register Expert do
  form do |f|
    f.inputs do
      f.input :last_name
      f.input :first_name
      f.input :middle_name
      f.input :category
      f.input :partner
      f.input :photo, hint: f.object.photo.url ? 
        f.template.image_tag(f.object.photo.url(:thumb)) :
        f.template.content_tag(:span, "")
      f.input :remote_photo_url
      f.input :description
      f.input :position
      f.input :post
      f.input :workplace
    end

    f.actions
  end

  index do
    column :id
    column :last_name
    column :first_name
    column :middle_name
    column "Photo" do |expert|
      link_to image_tag(expert.photo.url(:thumb)), expert.photo.url, target: '_blank'
    end
    column :description do |expert|
      truncate expert.description, length: 125, separator: ' '
    end
    column :position
    column :post
    column :workplace
    column :category
    column :partner
    default_actions
  end

  action_item except: [:show] do
    if I18n.locale == :en
      link_to "Rus version", locale: nil
    else
      link_to "Англ версия", locale: 'en'
    end
  end
  
  controller do
    def scoped_collection
      Expert.unscoped
    end

    def resource
      Expert.unscoped { super }
    end

    def create
      create! do |format|
        format.html { redirect_to admin_experts_url }
      end
    end

    def update
      update! do |format|
        format.html { redirect_to admin_experts_url }
      end
    end
  end
end
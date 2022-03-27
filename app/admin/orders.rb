ActiveAdmin.register Order do
  permit_params :name, :item_image, :total_price, :zip_code, :address, :payment_method, :quantity

  index do
    selectable_column
    id_column
    #column :item_id do |topic|
    # 3/23admin/item.rbでは下記でよかった。エラーのためコメントアウト
    # column :item_image do |topic|
    # image_tag(topic.item_id)
    # 3/23admin/item.rbでは下記で大丈夫だった。sizeを入れるとエラーのため、下記とその下をコメントアウト
    # image_tag(topic.item_image)
    # image_tag(topic.item_image, size: "100x100" )

    column :name
    column :user
    column :item
    column :payment_method
    column :zip_code
    column :address
    # column :price
    # column :quantity
    column :created_at
    column :updated_at
    actions
    end

    show do
    attributes_table do
      row :user
      row :name
      row :item
      row :payment_method
      row :zip_code
      row :address
      row :price
      row :quantity
      row :created_at
      row :updated_at
    end
  end
  # 3/23下記表示されないためコメントアウト
  # filter :name
  # filter :total_prize
    filter :sign_in_count
    filter :created_at
    filter :updated_at

  # form do |f|
  #   f.inputs do
  #     f.input :item_image,:as => :file
  #     f.input :name
  #     f.input :address
  #     f.input :price
  #   end
  #   f.actions
  # end
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :user_id, :item_id, :payment_method, :zip_code, :address, :name, :total_price, :quantity
  #
  # or
  #
  # permit_params do
  #   permitted = [:user_id, :item_id, :payment_method, :zip_code, :address, :name, :total_price, :quantity]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

end

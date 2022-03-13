ActiveAdmin.register Item do
  permit_params :name, :introduction

  index do
    selectable_column
    id_column
    column :name
    column :introduction
    column :price
    actions
  end

  filter :name
  filter :introduction
  filter :sign_in_count

  form do |f|
    f.inputs do
      f.input :name
    end
    f.actions
  end
  #下記からcreateの記述必要とわかったらコメントアウト
  # def create
  #   @post_image = PostImage.new(post_image_params)
  #   @post_image.user_id = current_user.id
  #   if @post_image.save
  #     redirect_to post_images_path
  #   else
  #     render :new
  #   end
  # end
  #ここまで

end

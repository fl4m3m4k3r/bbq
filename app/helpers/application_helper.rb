module ApplicationHelper
  def user_avatar(user)
    if user.avatar?
      image_tag(user.avatar.url)
    else
      image_pack_tag('media/images/user.png')
    end
  end

  def user_avatar_thumb(user)
    if user.avatar.file.present?
      image_tag(user.avatar.thumb.url)
    else
      image_pack_tag('media/images/user.png')
    end
  end

  def event_photo(event)
    photos = event.photos.persisted

    if photos.any?
      photos.sample.photo.url
    else
      image_pack_tag('media/images/event.png')
    end
  end

  def event_thumb(event)
    photos = event.photos.persisted

    if photos.any?
      photos.sample.photo.thumb.url
    else
      image_pack_tag('media/images/event_thumb.png')
    end
  end

  def bootstrap_class_for(flash_type)
    {
      success: 'alert-success',
      error: 'alert-danger',
      alert: 'alert-warning',
      notice: 'alert-success'
    }.stringify_keys[flash_type.to_s] || flash_type.to_s
  end

  def bootstrap_flash(opts = {})
    flash.each do |msg_type, message|
      concat(content_tag(:div, message, class: "alert #{bootstrap_class_for(msg_type)} alert-dismissible fade show", role: 'alert') do
        concat content_tag(:button, '', class: 'btn-close', data: { bs_dismiss: 'alert' })
        concat message
      end)
    end
    nil
  end

  def fa_icon(icon_class)
    content_tag 'span', '', class: "fa fa-#{icon_class}"
  end
end

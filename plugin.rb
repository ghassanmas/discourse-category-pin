# frozen_string_literal: true

# name: discourse-category-pin
# about: discourse-category-pin
# version: 0.0.1
# authors: Ghassan Maslamani
# url: discourse-category-pin
# required_version: 2.7.0
enabled_site_setting :category_pin_enabled
after_initialize do
  # Code which should run after Rails has finished booting
  DiscourseEvent.on(:topic_created) do |topic|
    if SiteSetting.category_pin_id?
      if topic.category_id?
        if topic.category_id == SiteSetting.category_pin_id
          # Check if there is exist topic
          topics_pinned =
            Topic.where(category: SiteSetting.category_pin_id).where.not(pinned_at: nil)
          topics_pinned.each { |pinned_topic| pinned_topic.update_pinned(false) }
          # Pinngin the current topic
          topic.update_pinned(
            true,
            gloabl = true,
            pinned_until = SiteSetting.category_pin_duration.minutes.from_now.to_s,
          )
        end
      end
    end
  end
end
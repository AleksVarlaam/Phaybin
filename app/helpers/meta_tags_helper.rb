# frozen_string_literal: true

module MetaTagsHelper
  def default_meta_tags
    {
      charset: 'utf-8',
      site: 'Phaybin.com',
      reverse: true,
      separator: '|',
      keywords: "",
      canonical: request.original_url,
      noindex: !Rails.env.production?,
      # manifest: '/manifest.webmanifest',
      og: {
        title: :title,
        site_name: 'Phaybin.com',
        description: :description,
        type: 'website',
        url: request.original_url,
        image: image_url('PhaybiN-logo-white.png')
      },
      author: 'Natalie Rabinovych',
      'geo.position' => '31.4117257;35.0818155',
      'geo.region' => 'IL',
      'geo.placename' => 'Israel'
    }
  end
end

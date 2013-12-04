require "sort_hb_plugin/version"
require "sort_hb_plugin/sort_tag"
require "sort_hb_plugin/boolean_sort_tag"

module SortHbPlugin
  class SortHbPlugin
    include Locomotive::Plugin

    def self.default_plugin_id
      'sort'
    end

    def self.liquid_tags
      {
        :by_field => SortTag,
        :boolean => BooleanSortTag,
      }
    end
  end
end

module Para
  module Config
    mattr_accessor :authenticate_admin_method
    @@authenticate_admin_method = :authenticate_admin_user!

    mattr_accessor :current_admin_method
    @@current_admin_method = :current_admin_user

    mattr_accessor :pagination_theme
    @@pagination_theme = 'twitter-bootstrap-3'

    mattr_accessor :admin_title
    @@admin_title = nil

    mattr_accessor :default_tree_max_depth
    @@default_tree_max_depth = 3

    mattr_accessor :resource_name_methods
    @@resource_name_methods = [:admin_name, :admin_title, :name, :title]

    mattr_accessor :plugins
    @@plugins = []

    # Hidden from initializer on purpose.
    #
    # This is mainly here to be overriden from a gem, not the app dev
    #
    mattr_accessor :ability_class_name
    @@ability_class_name = 'Para::Ability'

    mattr_accessor :page_actions
    @@page_actions = {}

    # Allows accessing plugins root module to configure them through a method
    # from the Para::Config class.
    #
    # Example :
    #
    #   Para.config do |config|
    #     config.my_plugin.my_var = 'foo'
    #   end
    #
    def self.method_missing(method_name, *args, &block)
      if plugins.include?(method_name)
        plugin = Para::Plugins.module_name_for(method_name).constantize
        block ? block.call(plugin) : plugin
      else
        super
      end
    end

    def self.routes
      Para::Routes
    end

    def self.page_actions_for(type)
      page_actions[type] ||= []
    end

    def self.add_actions_for(*types, &block)
      types.each do |type|
        page_actions_for(type) << block
      end
    end
  end
end

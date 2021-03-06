namespace :para do
  namespace :upgrade do
    desc <<-DESC
      Update database from SingletonResource to Form component without losing data
    DESC

    task singleton_to_form: :environment do
      class Para::Component::SingletonResource < Para::Component::Base
      end

      Para::Component::Base.where(type: 'Para::Component::SingletonResource').pluck(:identifier, :id).each do |identifier, id|
        if (form_component_id = Para::Component::Form.find_by_identifier(identifier).try(:id))
          Para::ComponentResource.where(component_id: id).update_all(component_id: form_component_id)
        end

        Para::Component::Base.where(id: id).destroy_all
      end
    end
  end

  namespace :components do
    desc <<-DESC
      Remove all components that are no longer referenced in the components.rb
      configuration file
    DESC

    task clean: :environment do
      require 'para/components_cleaner'
      Para::ComponentsCleaner.run
    end
  end
end

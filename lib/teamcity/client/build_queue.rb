module TeamCity
  class Client
    # Defines methods related to build types (or build configurations)
    module BuildQueue
      # HTTP GET

      # Triggering Build https://confluence.jetbrains.com/display/TCD10/REST+API#RESTAPI-TriggeringaBuild
      #
      # @return [Array<Hashie::Mash>, nil] 
      def create_buildqueue(buildtype_id, options = {}, &block)
        attributes = options.merge({
          buildType: {
            id: buildtype_id
          }
        })

        builder = TeamCity::ElementBuilder.new(attributes, &block)

        post("buildQueue", content_type: :json) do |req|
          req.body = builder.to_request_body
        end
      end
    end
  end
end

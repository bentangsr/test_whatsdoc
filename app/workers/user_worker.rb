module UserWorker
  class CreateAccount
    include Sidekiq::Worker
    sidekiq_options queue: :test_whatsdoc

    def perform(params_personable, params_user, type_personable)
      BuildUserPersonable.new(
        params_personable: params_personable,
        params_user: params_user,
        type_personable: type_personable
      ).run
    end
  end
end

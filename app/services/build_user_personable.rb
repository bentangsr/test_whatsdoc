class BuildUserPersonable
  def initialize(params_personable: ,params_user:, type_personable:)
    @params_user = JSON.parse(params_user) if params_user.present?
    @params_personable = JSON.parse(params_personable) if params_personable.present?
    @class_name = Object.const_get type_personable.titleize
  end

  def run
    personable = @class_name.new(@params_personable)
    if personable.save
      user = User.new(@params_user.merge(personable: personable))
      user.save
    end
  end
end
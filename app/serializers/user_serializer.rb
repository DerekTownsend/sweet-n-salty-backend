class UserSerializer < ActiveModel::Serializer
  attributes :id

  def initialize(user_object)
    @user = user_object
  end

  def to_serialized_json
    obj =
    {
       include:
       {
        snacks:
          {
            except: %i[created_at updated_at]
          }
        },
      except: %i[created_at updated_at]
    }

    @user.to_json(obj)
  end
end
class SnackSerializer < ActiveModel::Serializer
  attributes :id

  def initialize(snack_object)
    @snack = snack_object
  end

  def to_serialized_json
    obj =
    {
       include:
       {
         user:{except: %i[ password_digest created_at updated_at]},
          mixes:{
            include: {
              ingredient: { except: %i[created_at updated_at]}
            }, except: %i[ ingredient_id snack_id created_at updated_at]
          }
        },
      except: %i[ user_id created_at updated_at]
    }

    @snack.to_json(obj)
  end
end
# include: {
#   ingredient: { except: %i[created_at updated_at]}
# }, except: %i[ ingredient_id snack_id created_at updated_at]
# , except: %i[created_at updated_at]

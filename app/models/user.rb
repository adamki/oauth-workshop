class User < ActiveRecord::Base

  def self.from_omniauth(auth_info)
    if user = find_by(uid: auth_info.extra.raw_info.user_id)
      user
    else
      create({name: auth_info.extra.raw_info.name,
              screen_name: auth_info.extra.raw_info.screen_name,
              uid: auth_info.extra.raw_info.uid,
              oauth_token: auth_info.extra.raw_info.oauth_token,
              oauth_token_secret:auth_info.extra.raw_info.oauth_token_secret
             })
    end
  end
end

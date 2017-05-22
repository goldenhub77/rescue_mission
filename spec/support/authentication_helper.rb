require 'omniauth-github'

module AuthenticationHelper
  def sign_in_as(user)
    mock_auth_for(user)
    visit root_path
    click_link "Sign In"
  end

  def mock_auth_for(user)
    OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new(
      "provider" => user.provider,
      "uid" => user.uid,
      "info" => {
        "nickname" => user.nickname,
        "email" => user.email,
        "name" => user.name,
        "image" => user.avatar_url,
        "urls" => {
          "GitHub" => "",
          "Blog" => nil
        }
      },
      "credentials" => {
        "token" => user.token,
        "expires" => false
      },
      "extra" => {
        "raw_info" => {
          "login" => "",
          "id" => user.uid,
          "avatar_url" => user.avatar_url,
          "gravatar_id" => "",
          "url" => "",
          "html_url" => "",
          "followers_url" => "",
          "following_url" => "",
          "gists_url" => "",
          "starred_url" => "",
          "subscriptions_url" => "",
          "organizations_url" => "",
          "repos_url" => "",
          "events_url" => "",
          "received_events_url" => "",
          "type" => "User",
          "site_admin" => false,
          "name" => user.name,
          "company" => nil,
          "blog" => nil,
          "location" => "",
          "email" => user.email,
          "hireable" => true,
          "bio" => nil,
          "public_repos" => 0,
          "public_gists" => 0,
          "followers" => 0,
          "following" => 0,
          "created_at" => "",
          "updated_at" => ""
        }
      }
    )
  end
end

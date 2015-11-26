module UsersHelper
  # Returns the Gravatar for the given user.
  def gravatar_for(user)
    gravatar_url = "https://s.gravatar.com/avatar/cd86cf4615e88b865ce634953689a9d1?s=80"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end
  
  def gravatar_fors(user, micropost)
    gravatar_url = "https://s.gravatar.com/avatar/cd86cf4615e88b865ce634953689a9d1?s=80"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end
end

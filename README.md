# README


Tables are :Authentication, user profile, Pictures and comments.

made by gem 'devise', gem 'simple_form' and gem 'carrierwave'

to be able to see JUST current user posts

Applying database Query
http://guides.rubyonrails.org/active_record_querying.html

some other useful information like:

```

<td><%= link_to 'Show', profile_path(@profile.id) %></td>

 <!-- (@profile.id) is showing how to show :id mentioned in routes in oue link path -->

```
```
# to be able to see JUST current user posts
    # current_user is not nil if they've signed in with devise
    # puts "current_user is: #{current_user}"
    @posts = Post.all ## TURN THIS CODE ACTIVE AND OTHER CODES INACTIVE TO SEE ALL POSTS. ALSO IN VIEWS>POSTS>INDEX CHANGE THE @CURRENT_USER_POSTS TO @posts.
    #Applying database Query here in Post controller
    # http://guides.rubyonrails.org/active_record_querying.html
    # @current_user_posts = Post.where(user_id: current_user.id)
    # puts "@current_user_posts is: #{@current_user_posts.inspect}"

```
# Where, Find and Find_by 

look in to :      app/controllers/profiles_controller.rb

and read the follwing instruction to find the difference beteween 'where','find' and 'find_by'


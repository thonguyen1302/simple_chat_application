# README

SET UP

* rails db:create
* rails db:migrate
* rails db:seed
* rails s

After that the database has 7 animals. They are

"fish"

"dog"

"bird"

"car"

"elephant"

"lion"

"wolf"



RUN IT

Open the browser

Goto http://localhost:3000/

In the first time the browser will redirect to http://localhost:3000/join

![alt tag](https://github.com/thonguyen1302/simple_chat_application/blob/documents/docs/join_form.png "join_form.png")


Input the username is "cat"

![alt tag](https://github.com/thonguyen1302/simple_chat_application/blob/documents/docs/cat_username.png "cat_username.png")


After click "Join to chat", it will go to List users page

![alt tag](https://github.com/thonguyen1302/simple_chat_application/blob/documents/docs/list_users.png "list_users.png")


Now, we will use the other user to join to chat with Cat user.

Because the application doesn't have authentication, I used cookies to manage the username.

So you have to open the other browser or the private window of current browser. That make sure we have 2 users they have different cookies.

![alt tag](https://github.com/thonguyen1302/simple_chat_application/blob/documents/docs/private_window.png "private_window.png")

Goto http://localhost:3000/ and input the username is "fish" (do it in the other browser or private window)

![alt tag](https://github.com/thonguyen1302/simple_chat_application/blob/documents/docs/fish_username.png "fish_username.png")

After that the system also redirect to list users page.


Come back to the browser of the Cat user.

Click Message button of Fish user.

![alt tag](https://github.com/thonguyen1302/simple_chat_application/blob/documents/docs/select_fish.png "select_fish.png")


Chat something to Fish.
![alt tag](https://github.com/thonguyen1302/simple_chat_application/blob/documents/docs/cat_chat.png "cat_chat.png")

After that the card of Cat user in the list user page of Fish user will be change color and has a little animation. It's also has the "New messages" alert.

![alt tag](https://github.com/thonguyen1302/simple_chat_application/blob/documents/docs/new_messages.png "new_messages.png")


Click on the red Message button.

Say something with cat user.

![alt tag](https://github.com/thonguyen1302/simple_chat_application/blob/documents/docs/hello_cat.png "hello_cat.png")

You can chat more to continute the conversation.


I also did the pagination for messages (10 messages per page).

But, it's not display realtime in the conversation.

You need to reload the page to see that.

![alt tag](https://github.com/thonguyen1302/simple_chat_application/blob/documents/docs/load_more.png "load_more.png")


THANK YOU!
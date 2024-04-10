<div align="center">

<h1>Cutword</h1>

[![Gem Version](https://badge.fury.io/rb/cutword.svg)](https://badge.fury.io/rb/cutword)
![Downloads](https://img.shields.io/gem/dt/cutword.svg?&style=flat-square&label=Downloads&color=orange)


</div>

</div>

</div>


## Table of Contents



- [Description](#description)

- [Release Notes](#release-notes)

- [Features](#features)

- [Installation](#installation)

- [Paradigm](#paradigm)

- [Example](#example)

- [Rails Framework](#rails-framework)

- [Hanami Framework](#hanami-framework)



## Description



Cutword is a simple gem for truncating words/strings or shortening words and names, compatible with Rails and Hanami.

- It shortens long text in titles, picture names, labels, and more.


## Release-notes

Version 2.0.0



Major notes:

- It supports both Hanami framework and Rails.
- The first parameter specifies the limit (number of characters).
- The second parameter can be text, symbols, strings, or words.

-------

## Features



Attributes  |  Functionality |
------ | -------- |
`Cutword` | gem module that can be directly used as a function | 


## Installation


To install the Cutword, you can use the following gem install command:


Step 1:

- Paste to your `Gemfile` then save.


```bash

gem 'cutword', '~> 2.0'

```

Step 2:

- Run this to your Terminal

```bash

 bundle install

```


Step 3:

- Restart your Server



## Paradigm

`Cutword(number, 'Your text here')`

`Cutword(limit, 'words / names / titles / label / articles / paragraph / sentence')`

`Cutword(5, 'This is a short text.')`



## Example



Comparison |  Example words |
------ | -------- |
`Before` | Mary had a little lamb, its fleece was white as snow. | 
`After` | Mary had a little lamb, its...|





## Rails-framework

------------
## Method 1 - Rails
----------
No need to declare cutword module inside the controllers

--------------
In your View Template:

just use directly:

ex. index.html

```rb

  <% @articles.each do |article| %>
     <h2><%= Cutword(20, article.title) %></h2>
      <%= article.body %>
  <% end %>

```

ex. show.html

```rb

<%= Cutword(20, @article.title) %>

```
----------------
Method 2
--------------


```rb
# app/controllers/articles_controller.rb

class ArticlesController < ApplicationController
  def index
    @articles = Article.all.order("created_at DESC")
    @articleTitles = @articles.map { |article| Cutword(40, article.title) }
  end
end
```


In your View Template:

```rb

<% @articles.each_with_index do |article, index| %>
  <h2><%= @articleTitles[index] %></h2>
  <div><%= article.body %></div>
<% end %>

```

--------------------

-----------------

```rb
# app/controllers/articles_controller.rb

class ArticlesController < ApplicationController
  def show
    @article = Article.find(params[:id])
    @articleTitle = Cutword(40, @article.title)
  end
end

```

In your View Template:

```rb

<h1><%= @articleTitle %></h1>
<div><%= @article.body %></div>

```



## Hanami-framework

 `Hanami version 2.1.0 or greater`


Please follow these - [Installation](#installation) steps:

then proceed here:
-------
go to:

app/view/helpers.rb

add: 

require 'cutword'


-------
```rb
# app/bookshelf/views/helpers.rb

module Bookshelf
  module Views
    module Helpers
      # Add your view helpers here
       require 'cutword'
    end
  end
end

```

Let say your application is about books

----------------

## Method 1 - Hanami


go to:

app/bookshelf/views/books/index.rb

```rb
# app/bookshelf/views/books/index.rb

module Bookshelf
  module Views
    module Books
      class Index < Bookshelf::View
        include Deps["persistence.rom"]

        expose :books do |page:, per_page:|
          rom.relations[:books]
            .select(:title, :author)
            .order(:title)
            .page(page)
            .per_page(per_page)
            .to_a
            .map do |book|
              shorten_title = Cutword(10, book[:title])
              {
                title: shorten_title,
                author: book[:author]
              }
            end
        end
      end
    end
  end
end
```

go to:


app/bookshelf/views/books/show.rb


```ruby

# app/bookshelf/views/books/show.rb

module Bookshelf
  module Views
    module Books
      class Show < Bookshelf::View
        include Deps["persistence.rom"]

        expose :book do |id:|
          book_data = rom.relations[:books].by_pk(id).one!

          # Process the book title with Cutword
          if book_data && book_data[:title]
            book_data[:title] = Cutword(10, book_data[:title])
          end

          book_data
        end
      end
    end
  end
end
```

------------

or

## Method 2 - Hanami


note: don't forget to add: 

`require 'cutword'`

in your helpers, see above: [require 'cutword'](#hanami-framework)

-------

If you want to use the template directly:

```html
<!-- app/templates/books/index.html.erb -->

<h1>Books</h1>

<ul>
  <% books.each do |book| %>
    <li><%= Cutword(7, book[:title]) %>, by <%= book[:author] %></li>
  <% end %>
</ul>




```

```html

<!-- app/templates/books/show.html.erb -->

<h1><%= Cutword(7, book[:title]) %></h1> 

<p>By <%= book[:author] %></p>

```

## License


[MIT](http://www.opensource.org/licenses/MIT)



----------------------------------------------------

## Author



Demjhon Silver

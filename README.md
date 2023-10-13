<div align="center">

<h1>Cutword</h1>


[![Gem Version](https://img.shields.io/gem/v/cutword.svg?logo=ruby&style=flat-square&label=Latest&color=brightgreen)](https://rubygems.org/gems/cutword)
![Downloads](https://img.shields.io/gem/dt/cutword.svg?&style=flat-square&label=Downloads&color=orange)


</div>

</div>

</div>
<p align="center">

<img src="https://raw.githubusercontent.com/demjhonsilver/cutword/main/public/screenshot.png" alt="Logo" width="800" height="450"/>

</p>

## Table of Contents



- [Description](#description)

- [Release Notes](#release-notes)

- [Features](#features)

- [Installation](#installation)

- [Example](#example)



## Description



Cutword is a simple gem for string truncation/cut words in Ruby on Rails.

- Like uncontrolled long text in titles of articles, picture names, names, labels, etc.


## Release-notes

Version 1.0.0



Major notes:

- Renamed the `slicer` into `get` to make it short.
- 2 methods are available

-------



## Features



Attributes  |  Functionality |
------ | -------- |
`Cutword` | gem file module | 
`get` | to get the words and letters with dynamic limit value |


## Installation


To install the Cutword, you can use the following gem install command:


Step 1:

- Paste to your Gemfile then save.


```bash

gem 'cutword', '~> 1.0.0'

```

Step 2:

- Run this to your Terminal

```bash

 bundle install

```


Step 5:

- Restart Server

```bash

 rails s

```

## Example



Comparison |  Example words |
------ | -------- |
`Before` | Mary had a little lamb, its fleece was white as snow. | 
`After` | Mary had a little lamb, its...|


------------
Method 1
----------
No need to declare cutword module inside the controllers

--------------
In your View Template:

just use directly:

ex. index.html

```rb

  <% @articles.each do |article| %>
     <h2><%= Cutword.get(article.title, 20) %></h2>
      <%= article.body %>
  <% end %>

```

ex. show.html

```rb

<%= Cutword.get(@article.title, 20) %>

```
----------------
Methods 2
--------------


```rb
# app/controllers/articles_controller.rb

class ArticlesController < ApplicationController
  def index
    @articles = Article.all.order("created_at DESC")
    @articleTitles_cut = @articles.map { |article| Cutword.get(article.title, 40) }
  end
end
```


In your View Template:

```rb

<% @articles.each_with_index do |article, index| %>
  <h2><%= @articleTitles_cut[index] %></h2>
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
    @articleTitle_cut = Cutword.get(@article.title, 40)
  end
end

```

In your View Template:

```rb

<h1><%= @articleTitle_cut %></h1>
<div><%= @article.body %></div>

```

You can view the exact web application sample:

[Click here to see the actual code](https://github.com/demjhonsilver/ruby-on-rails-articles)


## License


[MIT](http://www.opensource.org/licenses/MIT)



----------------------------------------------------

## Author



Demjhon Silver

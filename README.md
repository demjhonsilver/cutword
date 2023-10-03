


<div align="center">

Cutword

--------



[![Gem Version](https://img.shields.io/gem/v/cutword.svg?logo=ruby&style=flat-square&label=Gem&color=blue)](https://rubygems.org/gems/cutword)





</div>

</div>

</div>

---------------------

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

Version 0.1.0



-------



## Features



Attributes  |  Functionality |
------ | -------- |
`Cutword` | gem file module | 
`slicer` | to slice the words and letters with dynamic limit value |


## Installation


To install the Cutword, you can use the following gem install command:


Step 1:

- Paste to your Gemfile then save.


```bash

gem 'cutword', '~> 0.1.0'

```
Step 2:

- Run this to your Terminal / Command Prompt / Powershell / Gitbash

```bash

gem install cutword

```


Step 3:

- Run this to your Terminal / Command Prompt / Powershell / Gitbash

```bash

 bundle install

```


Step 4:

- Restart Server

```bash

 rails s

```

## Example



Scene  |  Example words |
------ | -------- |
`Before` | Mary had a little lamb, its fleece was white as snow. | 
`After` | Mary had a little lamb, its...|


This is sample for Ruby on Rails:



```rb
# app/controllers/articles_controller.rb

class ArticlesController < ApplicationController
  def index
    @articles = Article.all.order("created_at DESC")
    @short_titles = @articles.map { |article| Cutword.slicer(article.title, 40) }
  end
end
```


In your View Template:

```rb

<% @articles.each_with_index do |article, index| %>
  <h2><%= @short_titles[index] %></h2>
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
    @short_title = Cutword.slicer(@article.title, 40)
  end
end

```

In your View Template:

```rb

<h1><%= @short_title %></h1>
<div><%= @article.body %></div>

```




## License


[MIT](http://www.opensource.org/licenses/MIT)



----------------------------------------------------

## Author



Demjhon Silver

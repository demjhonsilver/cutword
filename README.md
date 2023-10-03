


<div align="center">

Cutword

--------



[![Gem Version](https://img.shields.io/gem/v/cutword.svg?logo=ruby&style=flat-square&label=Gem&color=blue)](https://rubygems.org/gems/cutword)
[![Gem Downloads](https://img.shields.io/gem/dt/cutword.svg?&style=flat-square&label=Downloads&color=orange)](https://rubygems.org/gems/cutword)




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

```bash

gem install cutword

```


## Example


This is sample for Ruby on Rails:


```rb
# Example usage in a Rails controller:

class MyController < ApplicationController
  def index
    @truncated_text = Cutword.slicer('Lorem ipsum dolor sit amet', 10)
  end
end

```

```rb
# app/controllers/articles_controller.rb

class ArticlesController < ApplicationController
  def index
    @articles = Article.all.order("created_at DESC")
    @minimize_titles = @articles.map { |article| Cutword.slicer(article.title, 50) }
  end
end
```

## License


[MIT](http://www.opensource.org/licenses/MIT)



----------------------------------------------------

## Author



Demjhon Silver

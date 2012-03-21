# pg - project generator

## About

`pg` is a tool to generate projects based off of templates.

## Usage

The first time you run `pg` it will create a new directory in your home directory called `.pg`. This is where project templates are stored. `pg` also places a sample template in the `.pg` directory. Each template should be in its own folder which contains all files relating to that template as well as a `.pgconfig.rb` file. Try running `pg sample test`. That will create a folder called `test` initialized with the contents of the template `sample`. The sample `.pgconfig.rb` file contains the following:

	:::ruby
    prompt :title
    prompt :body, "What would you like for the main body text?"
    filter :erb, "*"
    ignore "CHANGELOG.txt"

This is a very simple configuration script which will prompt the user for a title and some body text. The line that says `filter :erb, "*"` says to filter all files that match the glob `*` (all files) through the filter `:erb`. Finally, the line that says `ignore "CHANGELOG.txt" says to not leave the file `CHANGELOG.txt` in the final initialized directory.

## Supported Filters

The following filters are supported. You must have the proper gems installed in order to use them.

* `:erb` (Embedded Ruby)
* `:str` (String Template)
* `:erubis`
* `:haml`
* `:sass`
* `:scss`
* `:less`
* `:builder`
* `:liquid`
* `:rdiscount`
* `:redcarpet`
* `:bluecloth`
* `:kramdown`
* `:maruku`
* `:redcloth`
* `:rdoc`
* `:radius`
* `:markaby`
* `:nokogiri`
* `:coffeescript`
* `:creole`
* `:wikicloth`
* `:yajl`
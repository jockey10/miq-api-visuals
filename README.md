# MIQ API Visualiser
A simple Sinatra app for visualising ManageIQ API resources.

## Description

The app retrieves resources using the ManageIQ REST API, and presents a pie-graph of the resource distribution.

## Try it out

```
$ git clone https://github.com/jockey10/miq-api-visuals
$ cd miq-api-visuals
$ bundle install
$ gem install shotgun
$ export MIQ_SERVER=10.1.2.3 && export MIQ_USER=api-user && export MIQ_PASS=api-password
$ shotgun config.ru -o 0.0.0.0 -p 5000
```
You can now visualise the ManageIQ 'tags' resource at http://localhost:5000/tags

## Notes

Presently the app only displays tags and tag-categories.


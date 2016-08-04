# LIM Test Application

This is a sample Rails application demonstrating the read the content of the website and store into database

### Getting started

This application is a creating tiny RESTful API to index a page's content. "Index the content" means to parse the page content and store its content - in this case to store the content that is found inside the tags h1, h2 and h3 and the links.. 

### Requirements

You need to setup the below

* Postgresql
* RVM (optional)
* Ruby (2.2.4)
* Rails (4.2.2)

To get the app up and running run this commands:

    bundle install
    rake db:setup
    rails server

To test that it works we can use `curl` to see it working:

    curl -H "Content-Type: application/json" -X POST\
         -d '{"web_site":{"url":"https://github.com"}}'\
          http://localhost:3000/api/v1/web_sites

    curl -H "Content-Type: application/json" -X GET\         
          http://localhost:3000/api/v1/web_sites

After starting this application, see the result in browser
``http://localhost:3000``.

### Conclusion

In sum, what one has to do is pick up the contents of the posted url, parse the  source code (html) and store the contents of h1, h2 and h3 and the links.
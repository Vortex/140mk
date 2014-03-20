[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/Vortex/140mk/trend.png)](https://bitdeli.com/free "Bitdeli Badge")

= 140.mk

* http://140.mk


== INSTALLATION

    - Install required gems

        [sudo] rake gems:install

    - Config database and twitter

        cp config/database.yml.template config/database.yml
        cp config/twitter.yml.template cp config/twitter.yml

    - Create and migrate database

        rake db:create
        rake db:migrate

    - Get all following (create or update)

        rake twitter:get_users

    - Get newest tweets 

        rake twitter:get_tweets

    - Prepare test environment

        [sudo] rake gems:install RAILS_ENV=test
        rake db:create RAILS_ENV=test
        rake db:test:prepare

    - Run features / specs

        spec spec
        cucumber features


== Known issues
 * Drag&Drop when choosing categories not working correctly in Opera and Explorer (possible cause http://dev.jqueryui.com/ticket/5537)


== LICENSE:

(The MIT License)

Copyright (c) 2009-2010 Dalibor Nasevic, Peco Danajlovski

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.



[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/Vortex/140mk/trend.png)](https://bitdeli.com/free "Bitdeli Badge")


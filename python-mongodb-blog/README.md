python-mongodb-blog
===================

Simple blog application used for testing MongoDB

Originally from https://github.com/gabrtv/python-mongodb-blog

Running locally
---------------

The app requires a local MongoDB instance exposed on `localhost` without
authentication enabled.

    $ cd python-mongodb-blog 
    $ pip install -r requirements.txt
    $ python blog/app.py

Pushing to Cloud Foundry
------------------------

This app requires an MongoDB service bound to the application (exposed in `VCAP_SERVICES`):

    $ cf create-service mongodb 3-6-6 mongoblog-db
    $ cd python-mongodb-blog 

Uncomment the services block in `manifest.yaml` or specify another existing MongoDB service

    $ cf push ...


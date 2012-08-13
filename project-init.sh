#!/bin/bash
set -x

init
{
    #virtualenv
    (virtualenv $1 || virtualenv2 $1) && cd $1
    source bin/activate

    #buildout
    bin/easy_install zc.buildout
    mkdir buildout && cd buildout
    buildout init
    wget http://svn.zope.org/*checkout*/zc.buildout/trunk/bootstrap/bootstrap.py
    wget -O ./buildout.cfg https://raw.github.com/Freshmilk/utilities/master/buildout/buildout.cfg
    wget -O ./buildout.cfg https://raw.github.com/Freshmilk/utilities/master/buildout/versions.cfg
    wget -O ./buildout.cfg https://raw.github.com/Freshmilk/utilities/master/buildout/development.cfg
    wget -O ./buildout.cfg https://raw.github.com/Freshmilk/utilities/master/buildout/runserver.cfg
    (python bootstrap.py || python2 bootstrap.py)
}

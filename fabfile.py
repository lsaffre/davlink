from atelier.fablib import *
setup_from_project()

env.use_mercurial = False  # i.e. use git

jb = JarBuilder('DavLink.jar', 'davlink')

@task
def classes():
    jb.build_classes()


@task
def jars():
    classes()
    jb.build_jar('example', 'mykey')
    jb.build_jar('example/signed', 'codegears')

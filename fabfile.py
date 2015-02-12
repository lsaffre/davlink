from atelier.fablib import *
setup_from_fabfile(globals())

env.revision_control_system = 'git'

from atelier.jarbuilder import JarBuilder
jb = JarBuilder(
    'DavLink.jar', 'davlink',
    'http://timestamp.globalsign.com/scripts/timestamp.dll')


@task
def classes():
    jb.build_classes()


@task
def jars():
    classes()
    jb.build_jar('example', 'mykey')
    # jb.build_jar('example/signed', 'codegears')

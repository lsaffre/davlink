# JFLAGS =
# JFLAGS = -d build -sourcepath src
JFLAGS = -Xlint:unchecked 


JAVAC = javac
#ALIAS = mykey
ALIAS = codegears

.SUFFIXES: .java .class

.java.class:
	$(JAVAC) $(JFLAGS) $*.java

JARFILE = example/DavLink.jar

SIGNERFLAGS = -tsa http://timestamp.globalsign.com/scripts/timestamp.dll -storepass "`cat ~/.secret/.keystore_password`"

SOURCES = davlink/DavLink.java

default: jars

classes: $(SOURCES:.java=.class)

jars: classes
	jar cvmf Manifest.txt $(JARFILE) davlink
	jarsigner $(SIGNERFLAGS) $(JARFILE) $(ALIAS)


clean:
	rm -f davlink/*.class
	rm -f $(JARFILE)



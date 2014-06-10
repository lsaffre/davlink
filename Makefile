# JFLAGS =
# JFLAGS = -d build -sourcepath src
JFLAGS = -Xlint:unchecked 


JAVAC = javac

.SUFFIXES: .java .class

.java.class:
	$(JAVAC) $(JFLAGS) $*.java

JARFILE = example/DavLink.jar

SIGNERFLAGS = -tsa http://timestamp.globalsign.com/scripts/timestamp.dll -storepass "`cat ~/.secret/.keystore_password`"

SOURCES = davlink/DavLink.java

default: jars_codegears

classes: $(SOURCES:.java=.class)

jars_mykey: classes
	jar cvmf Manifest.txt $(JARFILE) davlink
	jarsigner $(JARFILE) mykey

jars_codegears: classes
	jar cvmf Manifest.txt $(JARFILE) davlink
	jarsigner $(SIGNERFLAGS) $(JARFILE) codegears


clean:
	rm -f davlink/*.class
	rm -f $(JARFILE)



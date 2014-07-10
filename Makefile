# JFLAGS =
# JFLAGS = -d build -sourcepath src
JFLAGS = -Xlint:unchecked 
JAVAC = javac

.SUFFIXES: .java .class

.java.class:
	$(JAVAC) $(JFLAGS) $*.java

JARFILE = example/DavLink.jar
JARFILE_signed = example/DavLink_signed.jar

SIGNERFLAGS = -tsa http://timestamp.globalsign.com/scripts/timestamp.dll -storepass "`cat ~/.secret/.keystore_password`"

SOURCES = davlink/DavLink.java

default: jars_codegears jars_mykey

classes: $(SOURCES:.java=.class)

jars_mykey: classes
	jar cvmf Manifest.txt $(JARFILE) davlink
	jarsigner $(JARFILE) mykey

jars_codegears: classes
	jar cvmf Manifest.txt $(JARFILE_signed) davlink
	jarsigner $(SIGNERFLAGS) $(JARFILE_signed) codegears

clean:
	rm -f davlink/*.class
	rm -f $(JARFILE) $(JARFILE_signed)



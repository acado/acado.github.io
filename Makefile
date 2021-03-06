DOCS = \
	index features licensing developers publications blog \
	install_linux install_osx install_windows \
	matlab_overview matlab_getting_started \
	documentation extra_support \
	getting_involved dev_guide known_issues \
	cgt_overview \
	using_cmake_unix_common
HDOCS=$(addsuffix .html, $(DOCS))

all: $(HDOCS) #publications.html

install_linux.html :: install_unix_common.jemdoc download_zip.jemdoc
install_osx.html :: install_unix_common.jemdoc download_zip.jemdoc
install_windows.html :: install_unix_common.jemdoc download_zip.jemdoc
matlab_getting_started.html: download_zip.jemdoc

%.html : %.jemdoc MENU acado.conf
	jemdoc -c acado.conf -o $@ $<

#publications.html : publications.jemdoc mvukov_jabref.html MENU bibtex.conf
#	jemdoc -c bibtex.conf -o publications.html publications.jemdoc

clean:
	rm -rf $(HDOCS)

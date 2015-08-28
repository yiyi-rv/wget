#DEFS = @DEFS@ -DDATADIR=\"$(datadir)/@PACKAGE@\" -DSRCDIR=\"$(srcdir)\"
DEFS = @DEFS@ -DDATADIR=\"$(top_srcdir)/data\" -DSRCDIR=\"$(srcdir)\"
AM_CPPFLAGS = -Wno-missing-field-initializers -I$(top_srcdir)/include
AM_LDFLAGS = -static
LDADD = libtest.la ../libwget/libwget-@LIBWGET_API_VERSION@.la @LTLIBICONV@ @LTLIBINTL@ $(LIBIDN2) $(LIBUNISTRING) $(LIBPTHREAD)

# test-iri-disabled removed since Mget always uses IRIs
WGET_TESTS = test test-wget-1 test-restrict-ascii test-i-http test-i-https test-np test--spider-r \
 test-meta-robots test-idn-robots test-idn-meta test-idn-cmd \
 test-iri test-iri-percent test-iri-list test-iri-forced-remote \
 test-auth-basic test-parse-html test-parse-rss test--page-requisites test--accept \
 test-k test--follow-tags test-directory-clash test-ftp test-ftps

#test--post-file test-E-k

check_PROGRAMS = buffer_printf2_perf stringmap_perf $(WGET_TESTS)

test_SOURCES = test.c
test_LDADD = ../libwget/libwget-@LIBWGET_API_VERSION@.la ../src2/wget2-log.o ../src2/wget2-options.o @LTLIBICONV@ @LTLIBINTL@ $(LIBIDN2) $(LIBUNISTRING) $(LIBPTHREAD)
test_parse_html_LDADD = ../libwget/libwget-@LIBWGET_API_VERSION@.la ../src2/wget2-log.o ../src2/wget2-options.o @LTLIBICONV@ @LTLIBINTL@ $(LIBIDN2) $(LIBUNISTRING) $(LIBPTHREAD)

noinst_LTLIBRARIES = libtest.la
libtest_la_SOURCES = libtest.c
libtest_la_CPPFLAGS = -I$(srcdir) -I$(top_srcdir)/include
#libtest_LDADD = libtest.o

EXTRA_DIST = files libtest.h certs

clean-local:
	rm -rf $(srcdir)/.test_*

AM_TESTS_ENVIRONMENT = export VALGRIND_TESTS"=@VALGRIND_TESTS@";
TESTS = $(WGET_TESTS)

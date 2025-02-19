#!/bin/sh
#
# Simple script to fetch the latest commits via the github API.  Requires
# curl and jq.  Uses unauthenticated access which is ratelimited to 60
# queries per hour.

get_repo_sha()
{
	curl https://api.github.com/repos/llvm/$1/branches/main | \
	    jq -r '.commit.sha'
}

cat <<EOF > Makefile.snapshot
# Generated file!  Do not edit!  
#
# Generated by: files/gen-Makefile.snapshot.sh.
#
LLVM_MAJOR=	21
LLVM_RELEASE=	\${LLVM_MAJOR}.0.0
SNAPDATE=	$(date +%Y%m%d)

LLVM_PROJECT_COMMIT=		$(get_repo_sha llvm-project)
EOF

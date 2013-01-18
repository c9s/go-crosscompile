#!/bin/bash
function cgo-check {
    if [[ "${GOHOSTOS}" == "freebsd" ]]; then
        echo 0
        return
    fi
    if [[ "$1" == "${GOHOSTOS}" && "$2" == ${GOHOSTARCH} ]]; then
        echo 1
        return
    fi
    echo 0
}


eval "$(go env)"

if [[ -z "$GOROOT" ]] ; then
    # GOROOT is not set, use hg to clone go source?
    echo "GOROOT is not set: $GOROOT"
fi

if [[ -z "$GOPLATFORMS" ]] ; then
    # default platforms
    # declare -a GOPLATFORMS
    GOPLATFORMS=('darwin/386' 'darwin/amd64' 'freebsd/386' 'freebsd/amd64' 'freebsd/arm' 'linux/386' 'linux/amd64' 'linux/arm' 'windows/386' 'windows/amd64')
fi

for platform in "${GOPLATFORMS[@]}"; do
    local os=${platform%/*}
    local arch=${platform#*/}
    echo "Creating function go-$os-$arch..."
    eval "function go-$os-$arch(){
    CGO_ENABLED=\$(cgo-check $os $arch) GOOS=$os GOARCH=$arch go \$*
    }"
done


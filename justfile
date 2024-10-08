_default:
    just --list

# updates the crate to be in sync with the main repo
@update:
    git submodule update --remote
    cp ./boss/README.md ./README.md
    cargo update
    # find a way to copy the version and dependencies

# compares version of crate and local repo
@compare:
    echo -n 'CRATE: '
    cargo search boss-cli | rg --fixed-strings -- boss-cli
    echo -n 'REPO:  '
    head --lines 5 boss/Cargo.toml | rg --no-multiline --fixed-strings -- version
    echo -n 'LOCAL: '
    head --lines 5 Cargo.toml | rg --no-multiline --fixed-strings -- version

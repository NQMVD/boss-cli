_default:
    just --list
    echo 'needs sd for search and replace after update'

# updates the crate to be in sync with the main repo
@update:
    git submodule update --remote
    cp ./src/boss/README.md ./README.md
    sd './.assets' './src/boss/.assets' ./README.md
    cargo update
    # find a way to copy the version and dependencies

# compares version of crate and local repo
@compare:
    echo -n 'CRATE: '
    cargo search boss-cli | rg --fixed-strings -- boss-cli
    echo -n 'REPO:  '
    head --lines 5 ./src/boss/Cargo.toml | rg --no-multiline --fixed-strings -- version
    echo -n 'LOCAL: '
    head --lines 5 ./Cargo.toml | rg --no-multiline --fixed-strings -- version

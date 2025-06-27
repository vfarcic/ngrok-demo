#!/usr/bin/env nu

source  scripts/common.nu
source  scripts/kubernetes.nu
source  scripts/ingress.nu

def main [] {}

# Creates a local Kubernetes cluster
def "main setup" [] {

    rm --force .env

    let provider = (
        main get provider --providers [aws azure google]
    )

    main create kubernetes $provider

    main create kubernetes $provider --name dot-02 --auth false

    main print source
    
}

def "main destroy" [
    provider: string
] {

    (
        main destroy kubernetes $provider --name dot-02
            --delete_project false
    )

    main destroy kubernetes $provider

}

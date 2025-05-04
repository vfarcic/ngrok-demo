#!/usr/bin/env nu

source  scripts/common.nu
source  scripts/kubernetes.nu
source  scripts/ingress.nu

def main [] {}

# Creates a local Kubernetes cluster
def "main setup" [] {

    rm --force .env

    let provider = main get provider --providers [aws azure google upcloud]

    main create kubernetes $provider

    main print source
    
}

def "main destroy" [
    provider: string
] {

    main destroy kubernetes $provider

}

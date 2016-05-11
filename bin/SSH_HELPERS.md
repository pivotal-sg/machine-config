## SSH Helpers

- ssh config helpers
    - ssh-alias PROJECT HOST
    - (aka) ssh-project PROJECT HOST

        Add a ssh config entry which aliases PROJECT(host) to (host)

    - ssh-hubalias PROJECT (host is github)
    - (aka) ssh-hubproject PROJECT (host is github)

        Function wrapper on ssh-alias which defaults HOST to github.com

    - ssh-projectkey PROJECT (adds PUBLICKEY to clipboard)

        Create a read/write project key place the public half in clipboard

        - Name/save it as `~/.ssh/id_rsa_PROJECT`

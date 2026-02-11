terraform {
    backend "s3" {
        bucket = "itss-devops-ojt-tfstate"
        key    = "tfstate-devops-ojt-morales-module"
        region = "ap-southeast-1"
    }
}
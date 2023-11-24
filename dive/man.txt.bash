#install dive - https://github.com/wagoodman/dive
brew install dive

#Test Docker image bslobodenuk/app:v0.0.1
dive --ci --lowestEfficiency=0.9 bslobodenuk/app:v0.0.1
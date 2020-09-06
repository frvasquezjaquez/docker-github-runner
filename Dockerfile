FROM mcr.microsoft.com/dotnet/core/runtime:3.1

RUN useradd github-user

RUN mkdir -p /src/github-runner && chown github-user:github-user /src/github-runner

USER github-user

WORKDIR /src/github-runner

ARG RUNNER_VERSION

RUN curl -O -L https://github.com/actions/runner/releases/download/v$RUNNER_VERSION/actions-runner-linux-x64-$RUNNER_VERSION.tar.gz \
&& tar xzf ./actions-runner-linux-x64-$RUNNER_VERSION.tar.gz 

CMD ./config.sh --url $GITHUB_REPO --token $GITHUB_ACTION_TOKEN &&./run.sh
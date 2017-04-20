# CI/CD Playground for Puppet infrastructure using Docker (demo)

- GitLab
- GitLab CI
- Puppet
- r10k

# How to
`git clone https://github.com/Ananasr/continuous-delivery-playground.git`

Go create `code` project in gitlab.
Set `GITLAB_HOST` env var to host container IP address.

1. `docker-compose up -d`
2. `./2createProjectsAndCommitToGitLab.sh`
3. `docker exec -it puppet r10k deploy environment -p` #todo auto
4. `docker exec -it puppet puppet agent --test`
5. `docker exec -it runner gitlab-runner register` #todo auto
6. `docker exec -it runner gitlab-runner run` #todo auto
 
# Todo

- Use Swarm

# eveseat/docs

This dockerfile is one of many out there to get `mkdocs` up and running, quickly.

Build with: `docker build -t eveseat/docs .`.  
Run with: `docker run -d --rm -p 8000:8000 --name docs -v ${PWD}:/docs eveseat/docs` from the projects root.

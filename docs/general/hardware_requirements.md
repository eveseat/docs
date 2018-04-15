# Hardware Requirements

As far as hardware goes, there isn't really a hard and fast rule on what is needed. The more resources you make available, the faster API updates will occur. However, there are some minimum *recommended* specifications.

## Minimum Requirements
| Type | Requirement |
| ------- | ------- |
| Memory | 1GB of RAM with a swap file. More is better. |
| Hard Drive Space | 10GB (used mostly by the database and the EVE API caching). Again, more is better. Monitor this closely as your installation grows! |
| Operating System | Any linux distribution will work with SeAT (depending on how you choose to install). For Windows, the only option available is [Docker for Windows](https://docs.docker.com/docker-for-windows/) with Linux containers |

!!! warning

    If you intend to process a large amount of data, plan your storage accordingly. The SeAT database can grow incredibly quickly depending on the amount of tokens you process.

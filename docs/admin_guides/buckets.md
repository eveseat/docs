![SeAT](https://i.imgur.com/aPPOxSK.png)

# Buckets and continuous update

Starting with eveseat/console@4.7.0 and eveseat/eveapi@4.8.0, a new system has been designed to ensure continuous updates and reduce load on both SeAT stack and ESI.

## General

Each instance is allowed to get up to **30 buckets**. Every bucket will handle a batch of tokens, and their related characters and corporations data update.
Size of bucket is dynamically set based on the following criteria :
 - a token can be updated only once every **3600 seconds**
 - a token can be updated in an average of **120 seconds**

!!! info
    Most data ESI endpoint and data they deliver are restricted to a 1-hour cache long.
    However, certain are shorter and benefit of dedicated command to allow you update more frequently - please, do not abuse of them.

    - esi:update:contracts
    - esi:update:killmails
    - esi:update:affiliations
    - esi:update:notifications

## Health

You can determine a bucket status using `seat:buckets:list` and `seat:buckets:info ID` commands.
The first one will show you all existing buckets in the system together with the amount of token they're managing and their status.
The second will show you details about a specific bucket including characters they have the charge of.

A bucket can have one of the following status :
 - available : there are free slots according to current threshold
 - balanced : maximum tokens has been reached according to the current threshold, and the bucket cannot handle more token
 - overload : there are too many tokens handled by this bucket according to the current threshold

## Balancing

Bucket balancing is run every time a token is created or removed from the system.
As a result, you may find bucket with a certain amount of token at one time and a completely different one at another.

If you find yourself with unbalanced buckets, you can force them to be balanced using `seat:buckets:balance`.
However, depending on instance state, certain buckets will not be able to be more balanced for a time (ie: lack of tokens).

## Update

This system has been designed to ensure there is a bucket to update every two minutes (except for instances with less than 30 tokens).
You can force bucket to be processed and bypass the scheduler using `seat:buckets:update` - however, keep in mind that tokens handled by updating bucket will be frozen for 60 minutes.

!!! hint
    Manual command to force update character and corporation are still available. They require the ID of a tied character.

    - esi:update:characters character_id
    - esi:update:corporations character_id

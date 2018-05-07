![SeAT](http://i.imgur.com/aPPOxSK.png)

# Understanding Tracking

## Introduction
SeAT implements the [Google Analytics Measurement Protocol](https://developers.google.com/analytics/devguides/collection/protocol/v1/).
This document aims to explain in as much detail as possible how it has been implemented in SeAT, as well as what is tracked and what is not.
This document aims to be as transparent as possible.

## Why
Well, the most obvious is it being nice to know how much SeAT is actually being used.
One may argue that Github & packagist gives statistics on how many times the project has been installed / cloned, but that does not really
reflect how many *actual* active installations there are.

Knowing how many active installs there are, encourages development.

Lastly, certain exception types are also sent as hits. This helps *immensely* with figuring out if a new version may have a serious bug.

## How its implemented
First of all, the Google Analytics Measurement Protocol is really just that. It just measures usage. In summary, when certain events happen,
only a hit with what happened is sent. **No other data is sent with the hit.**

For example. When the scheduler queues jobs, a hit is sent that says that this happened, and that it happened for *x* amount of keys.
This can be seen in the following line of code: [https://github.com/eveseat/console/blob/master/src/Commands/Eve/QueueKeys.php#L96-L103](https://github.com/eveseat/console/blob/master/src/Commands/Eve/QueueKeys.php#L96-L103).
It can also be seen that no other data goes along with the hit. For example, the `access_token` and `refresh_token`
(which is what most will be worried about) does not go with the hit.

Once a hit is getting ready to be sent, information such as which OS/Version as well as versions of installed SeAT packages gets sent along with the hit.
This can be seen in the [following lines of code](https://github.com/eveseat/services/blob/master/src/Jobs/Analytics.php#L119-L156).

## How are you protecting my privacy?
Very special care has been taken to ensure that **no** personally identifiable information goes along with the Measurement Protocol hits.
In fact, [its actually not allowed](https://developers.google.com/analytics/devguides/collection/protocol/v1/parameters#uid) and serves no purpose for tracking.
That being said, the following actions have been taken to ensure that privacy is key:

- Source IP addresses are anonymized (Ref: [here](https://github.com/eveseat/services/blob/master/src/Jobs/Analytics.php#L132))
- Only OS Name, Machine Type and Version is reported. Type `a` is specifically **not** sent as it will disclose the hostname of the server (Ref: [here](https://github.com/eveseat/services/blob/master/src/Jobs/Analytics.php#L151-L153))
- Identifying an installation is done by generating a completely random V4 UUID. It is simply not possible to identify anyone with just this string (Ref: [here](https://github.com/eveseat/services/blob/master/src/Jobs/Analytics.php#L84-L90))
- If you insist, tracking can be completely disabled in the SeAT web interface (Ref: [here](https://github.com/eveseat/services/blob/master/src/Jobs/Analytics.php#L213-L214) and [here](https://github.com/eveseat/web/blob/master/src/Http/Controllers/Configuration/SeatController.php#L66))

## Can you link the commits where this was added?
Sure!

- [https://github.com/eveseat/services/commit/b2765c6d72f2e4069bc7f4c758f6a30c3872529b](https://github.com/eveseat/services/commit/b2765c6d72f2e4069bc7f4c758f6a30c3872529b)
- [https://github.com/eveseat/console/commit/f3f44dc6e84e73f06dd34872fc157949586ed764](https://github.com/eveseat/console/commit/f3f44dc6e84e73f06dd34872fc157949586ed764)
- [https://github.com/eveseat/eveapi/commit/cfdf20c0a271fbaa44ce17cd172d6be541265f53](https://github.com/eveseat/eveapi/commit/cfdf20c0a271fbaa44ce17cd172d6be541265f53)
- [https://github.com/eveseat/web/commit/ccd332dee18a93dd6041f6f1f989c214faf4e05d](https://github.com/eveseat/web/commit/ccd332dee18a93dd6041f6f1f989c214faf4e05d)
- [https://github.com/eveseat/services/commit/b4a80803a4ab00fa72c68d5774c02a61b243fdbc](https://github.com/eveseat/services/commit/b4a80803a4ab00fa72c68d5774c02a61b243fdbc)

## Are the stats a secret?
Not at all. However, as a start I am going to limit access to people whom have actively contributed towards SeAT.
If you would like access, please ping me on [Slack](http://seat-docs.readthedocs.io/en/latest/contact/#slack).

## How do I disable this crap?
If you *insist* on disabling the usage tracking, you can do this (as a SeAT administrator) by browsing to **Configuration** -> **SeAT Settings** and
setting **Allow Tracking** to **No**.

![disable tracking](https://i.imgur.com/SfU3ytq.png)

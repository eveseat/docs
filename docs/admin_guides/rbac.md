![SeAT](http://i.imgur.com/aPPOxSK.png)

## introduction
SeAT supports configuring user access control by means of [Role-based Access Control](https://en.wikipedia.org/wiki/Role-based_access_control). This allows for SeAT administrators to granularly control who has access to what based on which roles a SeAT user has.

## definitions
This section aims to clear up the definitions used in the SeAT RBAC (Role-based Access Control) implementation.

* **User**  
A SeAT user account. This can be either a user account that was created in SeAT itself, or an automatically created account based on SSO. The only difference between the accounts is that with an SSO account, SeAT has no idea what the accounts password is. Otherwise, everything else is exactly the same.

* **Permission**  
A Permission is an attribute that is assigned to a *Role*. It grants access based on the specific permission.

* **Role**  
A Role is simply a collection of permissions. Users get assigned a roles and inherit the permissions granted by that role. A user can not be given a raw permission. Permissions can only be granted my creating a Role, assigning permissions to the Role and granting the role to a user.

* **Affiliation**  
Affiliations allow administrators to set permissions bound to a specific entity. When configuring a role, permissions are granted to the role. When the an affiliation is set, the role effectively gives the permissions to the specified entities in the affiliation list. Not all roles are affected by affiliations. By default, only Corporation and Character roles are affected by affiliations.  

* **Entity**  
An entity is either a Character or a Corporation identified by its unique ID.

## Examples

### corporation accountant
Lets assume you wanted to create a role for a corporation accountant. To acheive this, you would do the following:

- Create a new role. Name it something like *Corporation Accountant*.
- Edit the new role, and grant it the `Corporation.ledger`, `Corporation.walletJournal`, `Corporation.transactions` and `Corporation.summary` (to view the sheet) permissions.
- Next, affiliate the role with the corporation(s) for whom this role should act as an accountant.
- Optionally, assign some users to the role. You can assign users at a later stage too.

Your configured role from the above example may now look as follows:

![corp accountant role](https://i.imgur.com/fF1IUqT.png)

## Permissions
The next list is a short definition of what the currently available permissions are and which sections of SeAT they grant access to. For the latest list of available permissions, please refer to the definitions file in the `eveseat/web` package [here](https://github.com/eveseat/web/blob/master/src/Config/web.permissions.php).

**Affiliation** column shows if the permissions considers affiliations.  
**Dangerous** column shows if the permission could be harmful if granted to the wrong user.

### Global Permissions
| Permission    | Affiliation | Dangerous | Description  |
| ------------- |-------------|-----------|--------------|
| superuser     | No          | **Yes**   | Grants administrative access to SeAT. This is a dangerous role to have! |
| queue_manager | No          | **Yes**   | Grants access to the SeAT Queue Interface with the ability to manage the queue too |

### API Key Permissions
| Permission    | Affiliation | Dangerous | Description  |
| ------------- |-------------|-----------|--------------|
| apikey.delete | Yes         | No        | Grants the ability to delete API Keys. |
| apikey.detail | Yes         | **Yes**   | Grants the ability to view API Key details. This includes the keys vCode. |
| apikey.toggle_status | Yes  | No        | Allows for an API Key to be re-enabled if disabled. |
| apikey.list   | No          | **Yes**   | Allows the listing of API Keys in SeAT. |
| apikey.update | Yes         | No        | Allows for an API Key to be updated. |

### Character Permissions
| Permission          | Affiliation | Dangerous | Description  |
| --------------------|-------------|-----------|--------------|
| character.assets    | Yes         | No        | Grants the ability to view Character Assets. |
| character.bookmarks | Yes         | No        | Grants the ability to view Character Bookmarks. |
| character.calendar | Yes         | No        | Grants the ability to view Character Calendar. |
| character.channels | Yes         | No        | Grants the ability to view Character Channels. |
| character.contacts | Yes         | No        | Grants the ability to view Character Contacts. |
| character.contracts | Yes         | No        | Grants the ability to view Character Contracts. |
| character.industry | Yes         | No        | Grants the ability to view Character Industry. |
| character.killmails | Yes         | No        | Grants the ability to view Character Killmails. |
| character.list | No         | **Yes**        | Grants the ability to list characters in SeAT. |
| character.mail | Yes         | No        | Grants the ability to view Character Mail. |
| character.market_orders | Yes         | No        | Grants the ability to view Character Market Orders. |
| character.notifications | Yes         | No        | Grants the ability to view Character Notifications. |
| character.pi | Yes         | No        | Grants the ability to view Character Planetary Interaction. |
| character.research_agents | Yes         | No        | Grants the ability to view Character Research Agents. |
| character.skills | Yes         | No        | Grants the ability to view Character Skills. |
| character.standings | Yes         | No        | Grants the ability to view Character Standings. |
| character.sheet | Yes         | No        | Grants the ability to view Character Sheet. **NOTE:** This is also the default view when selecting a character from the character list. It is recommended you grant this role in addition with any other character role. |
| character.wallet_journal | Yes         | No        | Grants the ability to view Character Wallet Journal. |
| character.wallet_transactions | Yes         | No        | Grants the ability to view Character Wallet Transactions. |

### Corporation Permissions
| Permission          | Affiliation | Dangerous | Description  |
| --------------------|-------------|-----------|--------------|
| corporation.assets  | Yes         | No        | Grants the ability to view Corporation Assets. |
| corporation.bookmarks  | Yes         | No        | Grants the ability to view Corporation Bookmarks. |
| corporation.contracts  | Yes         | No        | Grants the ability to view Corporation Contracts. |
| corporation.industry  | Yes         | No        | Grants the ability to view Corporation Industry. |
| corporation.killmails  | Yes         | No        | Grants the ability to view Corporation Killmails. |
| corporation.ledger  | Yes         | No        | Grants the ability to view Corporation Ledger. |
| corporation.list_all  | Yes         | **Yes**     | Grants the ability to list corporations in SeAT. |
| corporation.market  | Yes         | No        | Grants the ability to view Corporation Market Orders. |
| corporation.security  | Yes         | No        | Grants the ability to view Corporation Security Logs. |
| corporation.standings  | Yes         | No        | Grants the ability to view Corporation Standings. |
| corporation.tracking  | Yes         | No        | Grants the ability to view Corporation Member Tracking. |
| corporation.pocos  | Yes         | No        | Grants the ability to view Corporation POCOs. |
| corporation.starbases  | Yes         | No        | Grants the ability to view Corporation Starbases. |
| corporation.summary  | Yes         | No        | Grants the ability to view Corporation Summary. **NOTE:** This is also the default view when selecting a corporation from the corporation list. It is recommended you grant this role in addition to any other corporation role. |
| corporation.wallet_journal  | Yes         | No        | Grants the ability to view Corporation Wallet Journal. |
| corporation.transactions  | Yes         | No        | Grants the ability to view Corporation Wallet Transactions. |

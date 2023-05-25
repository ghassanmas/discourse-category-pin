# **Categoy Pin** Plugin

**Plugin Summary**

This plugin is provide a simple featuer, where you can choose a category by `id`, and set how long each new topic created in that categoy to be pinned for.

## Settings

The settings can be changed from admin plugins dashboard,

- category id, an integer of category which it's latest topic would be finned.
- durattion (in minutes), an intenger for how long the category would be pinned.

## Note

The topic would be unpinned when either is true:

- Pinning duration has passed.
- A new topic with same catgory is posted, before the duration finish:
  - i.e you post a topic and the setting is set to pinned for 60 minutes
  - After 30 minutes you post a new topic with same category id
    - The previous topic will be unpinned
    - The new topic would be pinned for duration that set.

- **The topic would be pinned globally**
  - In the future a new settings might be added to set as a flag to be pinned at category level only.

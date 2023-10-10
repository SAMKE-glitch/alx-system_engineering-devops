#!/usr/bin/python3
"""
Prints the title for the first 10 hot posts listed for a given subreddit
"""

from requests import get


def top_ten(subreddit):
    """
    queries the Reddit API and prints the titles of the
    first 10 hot posts listed for a given subreddit.
    """
    if subreddit is None or not isinstance(subreddit, str):
        print("None")

    user_agent = {'User-agent': 'Google Chrome Version 81.0.4044.129'}
    params = {'limit': 10}
    url = 'https://www.reddit.com/r/{}/hot/.json'.format(subreddit)

    response = get(url, headers=user_agent, params=params)
    results = response.json()

    try:
        myData = results.get('data').get('children')

        for i in myData:
            print(i.get('data').get('title'))

    except Exception:
        print('None')

#!/usr/bin/python3
"""
  The contains of 'top_ten function'.
"""
import requests


def top_ten(subreddit):
    """ A function that queries
              the Reddit API """
    Url = 'http://www.reddit.com/r/{}/hot/.json'.format(subreddit)
    headers = {'User-Agent': '0x16-api_advanced:project:v1.0.0'}
    params = {'limit': 10}
    r = requests.get(Url, headers=headers, params=params)
    if r.status_code == 200:
        data = r.json().get('data')
        [print(child["data"]["title"]) for child in data["children"]]
        return
    print('None')

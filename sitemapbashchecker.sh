#!/bin/bash

# Declare an array of sitemap URLs
sitemaps=("https://example.com/sitemap1.xml" "https://example.com/sitemap2.xml" "https://example.com/sitemap3.xml")

# Slack webhook URL
webhook_url="https://hooks.slack.com/services/T00000000/B00000000/XXXXXXXXXXXXXXXXXXXXXXXX"

# Get current date
current_date=$(date +%Y-%m-%d)

# Iterate through the sitemap URLs
for sitemap in "${sitemaps[@]}"
do
    # Check if the sitemap is up-to-date
    lastmod=$(curl -s $sitemap | grep '<lastmod>' | head -1 | sed 's/<lastmod>\(.*\)<\/lastmod>/\1/')
    if [ "$lastmod" != "$current_date" ]; then
        # Send a notification to Slack
        curl -X POST -H 'Content-type: application/json' --data '{"text":"Sitemap '"$sitemap"' is not up-to-date. Lastmod: '"$lastmod"'"}' $webhook_url
    fi
done

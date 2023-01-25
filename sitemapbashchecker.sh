#!/bin/bash

# Declare an array of sitemap URLs
sitemaps=("https://www.limetka.sk/exml/sitemap_sk_base.xml" "https://www.limetka.sk/exml/sitemap_sk_products.xml" "https://www.limetka.sk/exml/sitemap_sk_filters_1.xml")

# Slack webhook URL
slack_webhook_url="https://hooks.slack.com/services/T00000000/B00000000/XXXXXXXXXXXXXXXXXXXXXXXX"
# Discord webhook URL
discord_webhook_url="https://discordapp.com/api/webhooks/xxxxxxxxxx/xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
# Email address to send the notification to
email_to="example@email.com"
# SMTP server to use
smtp_server="smtp.example.com"
# SMTP username and password
smtp_username="example"
smtp_password="password"

# Choose the notification method (slack, discord, email)
notification_method="slack"

# Get current date
current_date=$(date +%Y-%m-%d)

# Function to send a notification
send_notification() {
    local message=$1
    if [ "$notification_method" == "slack" ]; then
        curl -X POST -H 'Content-type: application/json' --data "{\"text\":\"$message\" }" $slack_webhook_url
    elif [ "$notification_method" == "discord" ]; then
        curl -X POST -H 'Content-type: application/json' --data "{\"content\":\"$message\" }" $discord_webhook_url
    elif [ "$notification_method" == "email" ]; then
        echo "$message" | mail -s "Sitemap Update Error" -S smtp=$smtp_server -S smtp-auth=login -S smtp-auth-user=$smtp_username -S smtp-auth-password=$smtp_password $email_to
    fi
}

# Function to check the lastmod date of a sitemap
check_sitemap() {
    local sitemap=$1
    local lastmod=$(curl -s $sitemap | grep '<lastmod>' | head -1 | sed 's/<lastmod>\s*\(.*\)<\/lastmod>/\1/' | sed 's/^[ \t]*//')
    if [ -z "$lastmod" ]; then
        send_notification "Lastmod is empty in sitemap $sitemap"
    elif [ "$lastmod" != "$current_date" ]; then
        send_notification "Sitemap $sitemap is not up-to-date. Lastmod: $lastmod"
    else 
        echo "Sitemap $sitemap is up-to-date"
    fi
}

# Iterate through the sitemap URLs
for sitemap in "${sitemaps[@]}"
do
    check_sitemap $sitemap
done

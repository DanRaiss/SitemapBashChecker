## About Sitemap Bash Checker 🤖📒  
  

<a href="https://github.com/DanRaiss" target="_blank">
<img src=https://img.shields.io/badge/github-%2324292e.svg?&style=for-the-badge&logo=github&logoColor=white alt=github style="margin-bottom: 5px;" />
</a>  
  



### SitemapBashChecker  
Is designed to monitor the freshness of your website sitemaps. It checks if the lastmod time of the sitemap is up-to-date. If it is not, the script sends a notification to your Slack channel via webhook, so you can take appropriate action. 

The script is easy to use, simply provide an array of sitemap URLs and your Slack, Discord webhook URLs. Also there is an option for standard email notify. It's a great tool for website administrators to ensure that their sitemaps are always up-to-date, helping to improve their website's visibility and search engine rankings. This script can be scheduled to run at regular intervals, so you don't have to manually check for updates. 

With this script, you can be confident that your sitemaps are always fresh and accurate, saving you time and effort.
  

<br/>  

## Expected sitemap structure:
```
<sitemapindex xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
  <sitemap>
    <loc>https://www.example.cz/sitemap_cz.xml</loc>
    <lastmod>2023-01-25</lastmod>
  </sitemap>
  <sitemap>
    <loc>https://www.example.cz/sitemap_items_cz.xml</loc>
    <lastmod>2023-01-25</lastmod>
  </sitemap>
  <sitemap>
    <loc>https://www.example.cz/sitemap_category_cz.xml</loc>
    <lastmod>2023-01-25</lastmod>
  </sitemap>
</sitemapindex>
```

## Why use it
<table><tr><td valign="top" width="50%">

- The script ensures that your website sitemaps are always up-to-date ✅  
  

- It saves you time and effort by automatically checking the freshness of your sitemaps ⌛   
  

-  It sends notifications to your Slack channel, so you can take appropriate action  🔔  
  

-  It is easy to set up and use, simply provide an array of sitemap URLs and your Slack webhook URL. 🔧  
  

-  It can be easily scheduled to run at regular intervals using a task scheduler such as cron 🕐  


</td><td valign="top" width="50%">

<div align="center">
<img src="https://rishavanand.github.io/static/images/greetings.gif" align="center" style="width: 100%" />
</div>  


</td></tr></table>  

<br/>  

![Profile views counter](https://komarev.com/ghpvc/?username=DanRaiss&&style=flat-square)  
  

<br/>  


<br />

----
<div align="center">Generated using <a href="https://profilinator.rishav.dev/" target="_blank">Github Profilinator</a></div>

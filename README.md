# Emote365

Time flies by in a year, often with many upheavals and surprises. Emote365 is a visual calendar of each hour for each day in a year based on Twitter's trends. We utilize the Microsoft Cognitive Services API to run a sentiment analysis on the top trends for each hour, and return an image (via the Pexels API) that reflects the overall sentiment of those trends. A final image is saved for each day that represents the sentiments for the "trend of the day".

Instead of trying to remember everything that happened in a year, the user can scroll through all 365 images to experience the different emotions that were felt no matter where they went.  

## Current Features: 
- User can create an account or login with Twitter 
- When an account is created, so is their 'Home' calendar
- For each hour in a day, the image on the user's dashboard will update to reflect the sentiments of what's trending on Twitter that is based on the user's current location. 
- The images for the calendar will continually update regardless of whether the user is logged in at the moment. In which case, the trends will be based off of the user's last known location that gets recorded from their most recent login. 
- If a user stays logged in for an entire 24 hours, then they can see 24 different images for that day. However, the 25th image, or the only image that will be saved in their calendar will be reflective of the top trend. 
- User can see all 365 images for a calendar year (if they created an account a year go)
- User can view the image for the current hour/day along with previous images by clicking on the left or right arrows. 

## TODO
- Fix login (not through Twitter)
- Fix sticky footer on user dashboard 
- Refactor senitment analysis with IBM Alchemy API
- Implement Cron/Heroku Scheduler for when this gets deployed 
- Deploy to Heroku
- Host images with AWS
- Fix how current location and WOEID is retrieved and calculated 

## Technologies: 
- Rails 
- React 
- Devise-Omniauth 
- Oauth 
- Twitter API
- Pexels API
- IBM Alchemy API
- Yahoo! WOEID API
- Google Maps Geocoding API

## Collaborators:

- [Catherine Khuu](http://www.github.com/catkhuu)
- [Roman Leyvtskyy](http://www.github.com/LevytsRoman)

Web service for uploading videos to Instagram.

Based on https://github.com/mgp25/Instagram-API

docker build -t <tag_name> . 

docker run -d -p 80:80 <tag_name>

POST localhost/upload.php
    
    user='username'
    password='password'
    video='http://host/video.mp4'
    caption='text'
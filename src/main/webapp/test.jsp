<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Home Page</title>
        <style>
            body, html {
                margin: 0;
                padding: 0;
                height: 100%;
            }

            .image-container {
                width: 100%;
                position: relative;
                overflow: hidden;
            }

            .image-container img {
                width: 100%;
                height: 100%;
                position: absolute;
                transition: transform 1s ease-in-out;
            }

            .image-container img:nth-child(1) {
                transform: translateX(0%);
            }

            .image-container img:nth-child(2) {
                transform: translateX(100%);
            }

            .image-container img:nth-child(3) {
                transform: translateX(200%);
            }
        </style>
    </head>
    <body>
        <div class="image-container">
            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRezciPzNXW0kYiCP-iLDwS_W5x4SzHKaPJ6LZj9KgUvg&s" alt="Image 1">
            <img src="https://media-cdn-v2.laodong.vn/storage/newsportal/2023/8/26/1233821/Giai-Nhi-1--Nang-Tre.jpg" alt="Image 2">
            <img src="https://static-images.vnncdn.net/files/publish/2022/9/3/bien-vo-cuc-thai-binh-346.jpeg" alt="Image 3">
        </div>

        <script>
            document.addEventListener("DOMContentLoaded", function () {
                const imageContainer = document.querySelector(".image-container");
                const images = document.querySelectorAll(".image-container img");

                let currentIndex = 0;

                function showNextImage() {
                    currentIndex = (currentIndex + 1) % images.length;

                    images.forEach((image, index) => {
                        image.style.transform = `translateX(${(index - currentIndex) * 100}%)`;
                    });
                }

                setInterval(showNextImage, 2000); // Tự động chuyển ảnh sau 3 giây
            });
        </script>
    </body>
</html>

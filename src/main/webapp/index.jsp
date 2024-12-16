<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="org.mariadb.jdbc.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ABC Cinema</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">
    <script src="https://cdn.tailwindcss.com"></script>

</head>
<style>
    body {
        font-family: 'Poppins', sans-serif;
    }
</style>
<body class="bg-gray-100">

<nav id="navbar" class="bg-black/75 px-6 py-4 fixed w-8/12 top-2 left-1/2 transform -translate-x-1/2 z-50 rounded-lg shadow-lg transition-all duration-500 ease-in-out">
    <div class="flex items-center justify-between max-w-7xl mx-auto w-full">
        <div class="text-white text-2xl font-bold uppercase">ABC Cinema</div>

        <ul class="flex items-center space-x-8">
            <li><a href="index.jsp" class="text-white text-sm hover:bg-gray-700 px-3 py-2 rounded font-normal">Home</a></li>
            <li><a href="movies.jsp" class="text-white text-sm hover:bg-gray-700 px-3 py-2 rounded font-normal">Movies</a></li>
            <li><a href="cinemas.jsp" class="text-white text-sm hover:bg-gray-700 px-3 py-2 rounded font-normal">Cinemas</a></li>
            <li><a href="contactus.jsp" class="text-white text-sm hover:bg-gray-700 px-3 py-2 rounded font-normal">Contact Us</a></li>
            <li><a href="temp_buyTicket.jsp" class="bg-violet-950 text-white font-normal text-sm px-4 py-2 rounded">Buy Tickets</a></li>
        </ul>
    </div>
</nav>

<script>
    let lastScrollTop = 0;
    const navbar = document.getElementById('navbar');

    window.addEventListener('scroll', () => {
        const currentScroll = window.pageYOffset || document.documentElement.scrollTop;

        if (currentScroll > lastScrollTop) {
            navbar.style.top = '-100px';
        } else {
            navbar.style.top = '0.5rem';
        }

        lastScrollTop = currentScroll <= 0 ? 0 : currentScroll;
    });
</script>



<section class="relative w-full h-screen overflow-hidden bg-black">

    <div id="slideshow" class="relative w-full h-full">

        <div class="slide absolute inset-0 transition-opacity duration-1000 opacity-100">
            <img src="https://firebasestorage.googleapis.com/v0/b/kandy-city-centre.appspot.com/o/public%2Fmovies%2Fbackdrop%2F755856d4-0a81-4ec0-be01-49920071376f.jpg?alt=media&token=58a4b3e0-95be-4cdc-983a-d97fd296bd44" class="object-cover w-full h-full">
            <div class="absolute inset-0 bg-gradient-to-t from-black to-transparent"></div>
            <div class="absolute bottom-16 left-10 space-y-4">
                <h1 class="text-3xl font-bold text-white">ගෞතම බුද්ධ මාතා | Gauthama Budhdha Matha</h1>
                <p class="max-w-lg text-xs text-white">
                    සුවහසක් කාන්තාවන්ගේ විමුක්තිය වෙනුවෙන් මෙහෙණි සස්න ආරම්භ කිරීමට පුරෝගාමී වූ , බෞද්ධ සාහිත්‍යයේ අපට හමුවන පරම පූජනීය උතුම් කාන්තා රත්නයක් වන මහා ප්‍රජාපතී ගෝතමියගේ ජීවන කතා පුවතයි.
                </p>
                <button onclick="window.location.href='temp_buyTicket.jsp'" class="px-6 py-2 bg-violet-950 text-white font-semibold rounded">
                    Buy Tickets
                </button>
            </div>
        </div>

        <div class="slide absolute inset-0 transition-opacity duration-1000 opacity-0">
            <img src="https://firebasestorage.googleapis.com/v0/b/kandy-city-centre.appspot.com/o/public%2Fmovies%2Fbackdrop%2F9eda4426-418d-4ad9-b497-39f3f7ce2a61.jpg?alt=media&token=5a673ab8-494a-4f5d-8a51-56198b880e51" class="object-cover w-full h-full">
            <div class="absolute inset-0 bg-gradient-to-t from-black to-transparent"></div>
            <div class="absolute bottom-16 left-10 space-y-4">
                <h1 class="text-3xl font-bold text-white">புஷ்பா 2 | Pushpa 2 : The Rule</h1>
                <p class="max-w-lg text-xs text-white">
                    The clash is on as Pushpa and Bhanwar Singh continue their rivalry in this epic conclusion to the two-parted action drama.
                </p>
                <button  onclick="window.location.href='temp_buyTicket.jsp'" class="px-6 py-2 bg-violet-950 text-white font-semibold rounded">
                    Buy Tickets
                </button>
            </div>
        </div>
    </div>


    <div class="slide absolute inset-0 transition-opacity duration-1000 opacity-0">
        <img src="https://firebasestorage.googleapis.com/v0/b/kandy-city-centre.appspot.com/o/public%2Fmovies%2Fbackdrop%2F111b45c9-1fdd-4e99-b3de-d60255302fa4.jpg?alt=media&token=c6194650-dae5-4b51-bb75-a563d5abd693" class="object-cover w-full h-full">
        <div class="absolute inset-0 bg-gradient-to-t from-black to-transparent"></div>
        <div class="absolute bottom-16 left-10 space-y-4">
            <h1 class="text-3xl font-bold text-white">அமரன் | Amaran</h1>
            <p class="max-w-lg text-xs text-white">
                Amaran is a biopic that follows the personal and professional life of AC awardee Major Mukund Varadarajran who was martyred during action in the Qazipathri Operation of Shopian, on April 25th, 2014.
            </p>
            <button  onclick="window.location.href='temp_buyTicket.jsp'" class="px-6 py-2 bg-violet-950 text-white font-semibold rounded">
                Buy Tickets
            </button>
        </div>
    </div>


    <div class="slide absolute inset-0 transition-opacity duration-1000 opacity-0">
        <img src="https://firebasestorage.googleapis.com/v0/b/kandy-city-centre.appspot.com/o/public%2Fmovies%2Fbackdrop%2Fdbc93426-cf59-44f7-8c89-86cfc970465a.jpg?alt=media&token=437a561d-84de-4ea3-8e4e-5bcecdcb00d2" class="object-cover w-full h-full">
        <div class="absolute inset-0 bg-gradient-to-t from-black to-transparent"></div>
        <div class="absolute bottom-16 left-10 space-y-4">
            <h1 class="text-3xl font-bold text-white">Moana 2 (3D)</h1>
            <p class="max-w-lg text-xs text-white">
                After receiving an unexpected call from her wayfinding ancestors, Moana journeys alongside Maui and a new crew to the far seas of Oceania and into dangerous, long-lost waters for an adventure unlike anything she's ever faced.
            </p>
            <button onclick="window.location.href='temp_buyTicket.jsp'" class="px-6 py-2 bg-violet-950 text-white font-semibold rounded">
                Buy Tickets
            </button>
        </div>
    </div>


    <div class="slide absolute inset-0 transition-opacity duration-1000 opacity-0">
        <img src="https://firebasestorage.googleapis.com/v0/b/kandy-city-centre.appspot.com/o/public%2Fmovies%2Fbackdrop%2F2893dea8-2446-4adf-aad4-ac7ec7f89d0a.jpg?alt=media&token=28867948-77ac-4c65-bb64-e42c7e9acefd" class="object-cover w-full h-full">
        <div class="absolute inset-0 bg-gradient-to-t from-black to-transparent"></div>
        <div class="absolute bottom-16 left-10 space-y-4">
            <h1 class="text-3xl font-bold text-white">සෝලෝ ටවුන් | Solo Town</h1>
            <p class="max-w-lg text-xs text-white">
                The SOLO TOWN musical explores the themes of friendship, life goals, relationships, mistakes, betrayals, selfishness showcasing the triumphs and tribulations that shape our lives.
            </p>
            <button onclick="window.location.href='temp_buyTicket.jsp'" class="px-6 py-2 bg-violet-950 text-white font-semibold rounded">
                Buy Tickets
            </button>
        </div>
    </div>


    <div class="absolute bottom-8 left-1/2 transform -translate-x-1/2 flex space-x-3">
        <button class="dot w-7 h-2 bg-violet-950 rounded-sm"></button>
        <button class="dot w-7 h-2 bg-slate-600 rounded-sm"></button>
        <button class="dot w-7 h-2 bg-slate-600 rounded-sm"></button>
        <button class="dot w-7 h-2 bg-slate-600 rounded-sm"></button>
        <button class="dot w-7 h-2 bg-slate-600 rounded-sm"></button>
    </div>
</section>

<section class="bg-white py-20 px-6">
    <div class="max-w-7xl mx-auto">
        <h2 class="text-3xl font-bold text-center mb-10">Now Showing</h2>


        <%!
            private Connection getConnection() throws SQLException, ClassNotFoundException {
                Class.forName("org.mariadb.jdbc.Driver");

                String url = "jdbc:mariadb://localhost:3306/nowshowing";
                String user = "user";
                String password = "user";

                return DriverManager.getConnection(url, user, password);
            }
        %>

        <%
            Connection conn = null;
            Statement stmt = null;
            ResultSet rs = null;

            try {
                conn = getConnection();
                stmt = (Statement) conn.createStatement();
                String sql = "SELECT * FROM films";
                rs = stmt.executeQuery(sql);

                if (!rs.isBeforeFirst()) {
        %>
        <div class="text-center text-red-500 text-xl">
            No films are currently available.
        </div>
        <%
        } else {
        %>
        <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-2 lg:grid-cols-4 gap-4">
            <%
                while (rs.next()) {
                    String title = rs.getString("title") != null ? rs.getString("title") : "Unknown Title";
                    String description = rs.getString("description") != null ? rs.getString("description") : "No description available";
                    String imageUrl = rs.getString("imageUrl") != null ? rs.getString("imageUrl") : "default.jpg";
                    String cast = rs.getString("cast") != null ? rs.getString("cast") : "Cast not specified";
                    String releaseDate = rs.getString("releaseDate") != null ? rs.getString("releaseDate") : "TBA";
                    String categories = rs.getString("categories") != null ? rs.getString("categories") : "Not categorized";
                    String language = rs.getString("language") != null ? rs.getString("language") : "Unknown";
                    String trailer = rs.getString("trailer") != null ? rs.getString("trailer") : "";
            %>
            <div>
                <a href="temp_buyTicket.jsp">
                <div class="bg-gray-800 shadow-md m-4 cursor-pointer card" style="width: 16rem; border-radius: 5px">
                    <img src="<%= imageUrl %>"
                         alt="<%= title %>"
                         class="" style="width: 16rem; border-radius: 4px">

                </div>
                </a>
                <a href="temp_buyTicket.jsp">
                <div style="width: 16rem">
                    <h3 class="font-semibold text-violet-950"><%= title %></h3>
                    <div class="flex justify-between text-gray-900 text-sm mt-2">
                        <p> <%= releaseDate %></p>
                        <p><%= categories %></p>
                        <p><%= language %></p>
                    </div>
                </div>
                </a>
            </div>
            <%
                }
            %>
        </div>
        <%
            }
        } catch (ClassNotFoundException e) {
        %>
        <div class="text-center text-red-500 text-xl">
            Error: <%= e.getMessage() %>
        </div>
        <%
        } catch (SQLException e) {
        %>
        <div class="text-center text-red-500 text-xl">
            Error: <%= e.getMessage() %>
        </div>
        <%
            } finally {
                if (rs != null) try { rs.close(); } catch (SQLException ignore) {}
                if (stmt != null) try { stmt.close(); } catch (SQLException ignore) {}
                if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
            }
        %>

    </div>

    <script>
        const slides = document.querySelectorAll('.slide');
        const dots = document.querySelectorAll('.dot');
        let currentSlide = 0;
        function showSlide(index) {
            slides[currentSlide].classList.replace('opacity-100', 'opacity-0');
            slides[index].classList.replace('opacity-0', 'opacity-100');
            dots[currentSlide].classList.replace('bg-violet-950', 'bg-slate-600');
            dots[index].classList.replace('bg-slate-600', 'bg-violet-950');
            currentSlide = index;
        }
        dots.forEach((dot, index) => {
            dot.addEventListener('click', () => showSlide(index));
        });

        setInterval(() => {
            const nextSlide = (currentSlide + 1) % slides.length;
            showSlide(nextSlide);
        }, 5000);
    </script>

</section>

<div class="flex justify-center items-center space-x-8 p-10">
    <div class="bg-red-800 text-white p-6 rounded-lg shadow-lg w-64">
        <h2 class="text-lg font-semibold">ABC Multiplex</h2>
        <p class="mt-2 flex items-center">
            <span class="material-icons mr-2">wifi</span> <span>Dolby Atmos</span>
        </p>
        <p class="mt-1 flex items-center">
            <span class="material-icons mr-2">tv</span> <span>4K Digital Projection</span>
        </p>
        <div class="mt-2 text-sm">DOLBY ATMOS</div>
    </div>

    <div class="bg-yellow-800 text-white p-6 rounded-lg shadow-lg w-64">
        <h2 class="text-lg font-semibold">ABC Multiplex 01</h2>
        <p class="mt-2 flex items-center">
            <span class="material-icons mr-2">wifi</span> <span>Dolby 7.1 Sounds</span>
        </p>
        <p class="mt-1 flex items-center">
            <span class="material-icons mr-2">tv</span> <span>2K Laser Projection</span>
        </p>
        <div class="mt-2 text-sm">DOLBY SURROUND 7.1</div>
    </div>

    <div class="bg-gray-800 text-white p-6 rounded-lg shadow-lg w-64">
        <h2 class="text-lg font-semibold">ABC Multiplex 01</h2>
        <p class="mt-2 flex items-center">
            <span class="material-icons mr-2">wifi</span> <span>Dolby 7.1 Sounds</span>
        </p>
        <p class="mt-1 flex items-center">
            <span class="material-icons mr-2">tv</span> <span>2K Laser Projection</span>
        </p>
        <div class="mt-2 text-sm">DOLBY SURROUND 7.1</div>
    </div>
</div>

<footer class="bg-black text-white pt-10">
    <div class="container mx-auto px-6">
        <div class="flex flex-col md:flex-row justify-between space-y-8 md:space-y-0">
            <div>
                <h3 class="text-lg font-bold">ABC Cineplex</h3>
                <ul class="mt-4 space-y-2 text-gray-400">
                    <li><a href="#" class="hover:text-white">Buy tickets</a></li>
                    <li><a href="#" class="hover:text-white">Movies</a></li>
                </ul>
            </div>

            <div>
                <h3 class="text-lg font-bold">General</h3>
                <ul class="mt-4 space-y-2 text-gray-400">
                    <li><a href="#" class="hover:text-white">Cinema Complex</a></li>
                    <li><a href="#" class="hover:text-white">Contact Us</a></li>
                </ul>
            </div>

            <div>
                <h3 class="text-lg font-bold">Newsletter</h3>
                <p class="mt-4 text-gray-400">Join our mailing list for promotions and latest movie updates.</p>
                <div class="mt-4 flex">
                    <input type="email" placeholder="Type your email address" class="w-full p-2 rounded-l-lg text-black focus:outline-none">
                    <button class="bg-violet-950 text-white px-4 rounded-lg">Subscribe</button>
                </div>
            </div>
        </div>

        <div class="border-t border-gray-700 pt-6 flex flex-col items-center md:flex-row justify-between items-center pb-5 mt-4">
            <div class="text-gray-400 text-center text-sm">
                <a href="#" class="hover:text-white">Privacy policy</a> |
                <a href="#" class="hover:text-white">Terms and conditions</a>
            </div>

            <p class="text-gray-400 text-sm text-center md:text-left">
                © Made with ❤️ in Ceylon 🇱🇰
            </p>
        </div>

    </div>
</footer>

</body>
</html>


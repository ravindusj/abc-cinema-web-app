<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<body>

<h1>Add Book </h1>

<form action="bookServlet">
    <table>
        <tr>
            <td>Book Title:</td>
            <td><input type="text" name="title" required></td>
        </tr>
        <tr>
            <td>Author:</td>
            <td><input type="text" name="author" required></td>
        </tr>
        <tr>
            <td></td>
            <td><input type="submit" value="Add Book"></td>
        </tr>
    </table>
</form>

</body>
</html>


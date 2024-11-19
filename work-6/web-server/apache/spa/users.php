<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Список пользователей</title>
</head>
<body>
    <h1>Список пользователей</h1>

    <!-- Ссылка для возвращения на главную страницу -->
    <a href="index.html">Вернуться на домашнюю страницу</a>

    <?php
    // Подключение к базе данных MySQL
    $servername = "mysql"; // Имя сервиса из docker-compose.yml
    $username = "user"; // Имя пользователя MySQL
    $password = "user_password"; // Пароль MySQL
    $dbname = "my_database"; // Имя базы данных

    // Создание соединения
    $conn = new mysqli($servername, $username, $password, $dbname);

    // Проверка соединения
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

    // SQL-запрос для получения данных из таблицы users
    $sql = "SELECT id, name, email FROM users";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        // Вывод данных в виде таблицы
        echo "<table border='1'>";
        echo "<tr><th>ID</th><th>Name</th><th>Email</th></tr>";
        while ($row = $result->fetch_assoc()) {
            echo "<tr>";
            echo "<td>" . $row["id"] . "</td>";
            echo "<td>" . $row["name"] . "</td>";
            echo "<td>" . $row["email"] . "</td>";
            echo "</tr>";
        }
        echo "</table>";
    } else {
        echo "No results found";
    }

    // Закрытие соединения
    $conn->close();
    ?>

</body>
</html>


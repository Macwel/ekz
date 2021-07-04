<?php
$host = 'localhost';
$dbname = 'orders';
$user = 'root';
$pass = '';
try {
    $dbh = new PDO("mysql:host=${host};dbname=${dbname}", $user, $pass);
} catch (PDOException $e) {
    print_r("Error: {$e->getMessage()}");
    die();
}



?>
<form method="post">
    <input type="date" name="date1">
    <input type="date" name="date2">
    <input type="submit" name="submit">
</form>
<?php

if(isset($_POST["submit"])){
    $date1 = $_POST['date1'];
    $date2 = $_POST['date2'];
    $sth = $dbh->prepare("SELECT order_name,order_id,sum(order_cost) as sum, COUNT(*) as count FROM orders WHERE `order_date` BETWEEN '{$date1}' AND '{$date2}}' GROUP BY order_name ASC");
    $sth->execute();
    $s = $sth->fetchAll(PDO::FETCH_ASSOC);

?>


<table cellpadding="0" cellspacing="0" border="0">
    <thead>
    <style>
        td{
            min-width: 150px;
        }
    </style>
    <tr>
        <th>Id</th>
        <th>Название товар</th>
        <th>Сумма продаж</th>
        <th>Кол-во продаж</th>
    </tr>
    </thead>
    <tbody>
    <?php
    foreach ($s as $item) {

        ?>
        <form method='POST'>

            <tr>
                <td><? echo $item['order_id'] ?></td>
                <td><? echo $item['order_name']?></td>
                <td><? echo $item['sum'] ?></td>
                <td><? echo $item['count'] ?> </td>
            </tr>
        </form>

        <?
    }
    ?>
    </tbody>
</table>
<?php
}
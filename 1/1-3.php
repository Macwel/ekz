<?php
$host = 'localhost';
$dbname = 'test';
$user = 'root';
$pass = '';
try {
    $dbh = new PDO("mysql:host=${host};dbname=${dbname}", $user, $pass);
} catch (PDOException $e) {
    print_r("Error: {$e->getMessage()}");
    die();
}
if (isset($_POST['submit'])) {
    $sth = $dbh->prepare("SELECT * FROM `staff` ORDER BY `staff`.`staff_count` ASC");
    $sth->execute();
    $s = $sth->fetch(PDO::FETCH_ASSOC);
    $order_name = $_POST['name'] . " " . $_POST['surname'];
    $order_staff = $s['staff_id'];
    $staff_count = $s['staff_count'] + 1;
    $order_cost = $_POST['qty'] * 200;
    $order_status = 'Поступил';
    $order_typeProd = $_POST['type'];
    try {
        $sth = $dbh->prepare("INSERT INTO `orders`(`order_name`, `order_staff`, `order_cost`, `order_status`, `order_typeProd`) VALUES ('{$order_name}','{$order_staff}','{$order_cost}','{$order_status}','{$order_typeProd}')");
        $sth->execute();
    } catch (PDOException $e) {
        print_r("Error: {$e->getMessage()}");
        die();
    }
    $sth = $dbh->prepare("UPDATE `staff` SET `staff_count`='{$staff_count}' WHERE staff_id = {$order_staff}");
    $sth->execute();
}
$sth = $dbh->prepare("select * from orders INNER JOIN staff on order_staff = staff.staff_id");
$sth->execute();
$orders = $sth->fetchAll(PDO::FETCH_ASSOC);
?>

    <table cellpadding="0" cellspacing="0" border="0">

    </table>
<table cellpadding="0" cellspacing="0" border="0">
    <thead>
    <style>
        td{
            min-width: 150px;
        }
    </style>
    <tr>
        <th>Id</th>
        <th>ФИО работника</th>
        <th>ФИО заказчика</th>
        <th>Стоимость заказа</th>
        <th>Статус заказа</th>
        <th>Тип изделия</th>
    </tr>
    </thead>
    <tbody>
    <?
    foreach ($orders as $order) {

        ?>
        <form method='POST'>

            <tr>
                <td><? echo $order['order_id'] ?></td>
                <td><? echo $order['staff_name'] . $order['staff_surname'] ?></td>
                <td><? echo $order['order_name'] ?></td>
                <td><? echo $order['order_cost'] ?> </td>
                <td><? echo $order['order_status'] ?></td>
                <td><? echo $order['order_typeProd'] ?></td>
            </tr>
        </form>

        <?
    }
    ?>
    </tbody>
</table>
<form method="post">
    <input type="text" name='type' placeholder="Вид изделия">
    <input type="text" name='name' placeholder="Имя">
    <input type="text" name='surname' placeholder="Фамилия">
    <input type="text" name='qty' placeholder="Кол-во материалов">
    <input type="submit" name="submit" value="Создать заказ">
</form>


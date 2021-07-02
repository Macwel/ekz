<?php

class T{
    static protected $host = 'localhost';
    static protected $user = 'root';
    static protected $pass = '';
    static protected $dbname = 'ekz';


    protected function __constructor(){
        $host = self::$host;
        $user = self::$user;
        $pass = self::$pass;
        $dbname = self::$dbname;

        try {
            return new PDO("mysql:host=${host};dbname=${dbname}", $user, $pass);

        } catch (PDOException $e) {
            print "Error!: " . $e->getMessage() . "<br/>";
            die();
        }

    }
    public function zarplata($id,$dbh){

        $sth = $dbh->prepare('select tariffs.cost,completed.hours from staff inner join tariffs on staff.spec = tariffs.spec inner join completed on staff.id = completed.staff_id where staff.id = ' . $id );
        $sth->execute();
        $arr = $sth->fetchAll(PDO::FETCH_ASSOC);
        $zp = 0;
        foreach ($arr as $i){
            $zp+=$i['hours'];
        }
        return $arr[0]['cost'] * $zp;
    }

     public function index(){
        $dbh = $this->__constructor();
        $sth = $dbh->prepare('select staff.id,staff.name,staff.surname,spec.spec_title from staff INNER JOIN spec on staff.spec = spec.spec_id');
        $sth->execute();
        $arr = $sth->fetchAll(PDO::FETCH_ASSOC);

        include_once 'components.php';
        $components = new Components;
        $components->input($arr);
        if(isset($_POST['submit'])){
            $zp =self::zarplata($_POST['id'],$dbh);
            $components->zp($zp);
        }

    }

}

$r = new T;
$r->index();


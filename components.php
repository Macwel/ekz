<?php

class Components{

    public function __construct()
    {
        print_r('<link rel="stylesheet" type="text/css" href="index.css">');
    }

    public function input($array){
        ?>
        <section>
            <h1>Сотрудники</h1>
            <div class="tbl-header">
                <table cellpadding="0" cellspacing="0" border="0">
                    <thead>
                    <tr>
                        <th>Id</th>
                        <th>Имя</th>
                        <th>Фамилия</th>
                        <th>Специальность</th>
                        <th>ЗП</th>
                    </tr>
                    </thead>
                </table>
            </div>
            <div class="tbl-content">
                <table cellpadding="0" cellspacing="0" border="0">
                    <tbody>
                    <?
                    foreach($array as $arr){

                    ?>
                    <form method='POST'>

                    <tr>
                        <td><? echo $arr['id']?></td>
                        <td><input type="hidden" name="id" value="<? echo $arr['id']?>"></td>
                        <td><? echo $arr['name']?></td>
                        <td><? echo $arr['surname']?> </td>
                        <td><? echo $arr['spec_title']?></td>
                        <td><input type="submit" name="submit" value="Подсчёт"></td>
                    </tr>
                    </form>

                        <?
                    }
                        ?>
                    </tbody>
                </table>
            </div>
        </section>
        <?php
    }
    public function zp($zp){
        print_r($zp);
    }
<form method="POST">
        <input type="date" id="start" name="trip-start"
               value="2021-01-01"
               min="2021-01-01" max="2021-09-25">
<!--        <input type="submit" name="submit" value="Подсчёт">-->
    </form>

    <script>

        const validate = dateString => {
            
            const day = (new Date(dateString)).getDate();
            for(){
                arr = ['dateString'=='2021-07-05']
                if()
            }
            if (dateString=='2021-07-05' || dateString=='2021-07-06' || dateString=='2021-07-07' || day==6) {
                return false;
            }
            return true;
        }

        // Sets the value to '' in case of an invalid date
        document.querySelector('input').onchange = evt => {

            if (!validate(evt.target.value)) {
                evt.target.value = '';
            }
        }
    </script>
}

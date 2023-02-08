<?php

    class Conectar{
        protected $dbh;

        protected function Conexion(){
            try{
                $conectar = $this->dbh = new PDO("mysql:local=localhost;dbname=pokedex","root","");
                return $conectar;
            }
            catch(Exception $e){
                print "Error DB" . $e->getMessage() . "<br/>";
            }
        }

        protected function set_names(){
            return $this->dbh->query("SET NAMES 'utf8'");
        }
    }

?>
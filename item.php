<?php
  class Message{
    var $name ;
    var $time ;
    var $content ;

    function __construct( $n, $t, $c ) {
      $this->name = $n ;
      $this->time = $t ;
      $this->content = $c ;
    }
    function show(){
      echo "Name: ".$this->name."<br>" ;
      echo "time: ".$this->time."<br>" ;
      echo "content: ".$this->content."<br>" ;
      echo "= = = = = = = = = = = = = = = = = = = = = = = = =" ;
    }
  }

  $m = new Message( "123","456","789" ) ;
  $m->show ;

?>

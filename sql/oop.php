<?php
class Bike {
    private $price;
    private $cost;

    // constructor method
    public function __construct ( float $newCost, float $newPrice) {
        $this->setPrice($newPrice);
        $this->setCost($newCost);
    }

    //getters
    public function getPrice() :float{
        return ($this->price);
    }
    public function getCost() :float{
        return ($this->cost);
    }
    
    //setters
    public function setPrice (float $newPrice) :void {
        $this->price = $newPrice;
    }
    public function setCost (float $newCost) :void
    {
        $this->cost = $newCost;
    }

    // profit method
    public function profit () :float {
        return ($this->getPrice() - $this->getCost());
    }
}

$customBoard = new Bike(1000 ,400);
$profit =  $customBoard->profit();

var_dump($profit);
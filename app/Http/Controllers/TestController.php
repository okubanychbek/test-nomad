<?php

namespace App\Http\Controllers;

use App\Models\Contract;
use Illuminate\Support\Facades\DB;

class TestController
{
     public function test()
     {
         Contract::create([
             'contract_id' => rand('30', 100),
             'contract_date' => now(),
             'begin_date' => now(),
             'contract_type' => rand('20', 233),
             'contract_number' => 'Contract1231212',
         ]);

         echo 'success';
     }
}

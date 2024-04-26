<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class ContractSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        for ($i = 0; $i < 10; $i++) {
            DB::table('contracts')->insert([
                'ID_Class' => $i + 1,
                'Contract_Date' => now(),
                'Begin_Date' => now(),
                'Contract_Type' => rand(1, 5),
                'Contract_Number' => 'Contract ' . ($i + 1),
                'created_at' => now(),
                'updated_at' => now(),
            ]);
        }
    }
}

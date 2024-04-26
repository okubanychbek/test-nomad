<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Contract extends Model
{
    protected $table = 'contracts';
    protected $primaryKey = 'ID_Class';
    protected $guarded = [];

    protected $map = [
        'contract_id' => 'ID_Class',
        'contract_date' => 'Contract_Date',
        'begin_date' => 'Begin_Date',
        'contract_type' => 'Contract_Type',
        'contract_number' => 'Contract_Number',
    ];

    public function getAttribute($key)
    {
        if (isset($this->map[$key])) {
            return parent::getAttribute($this->map[$key]);
        }

        return parent::getAttribute($key);
    }

    public function setAttribute($key, $value)
    {
        if (isset($this->map[$key])) {
            return parent::setAttribute($this->map[$key], $value);
        }

        return parent::setAttribute($key, $value);
    }
}

<?php

namespace Inlead\Model;

class Consumer
{
    public $id;
    public $name;
    public $sourceUrl;

    /**
     * @param array $data
     */
    public function exchangeArray(array $data): void
    {
        $this->id = $data['id'] ?? null;
        $this->name = $data['name'] ?? null;
        $this->sourceUrl = $data['source_url'] ?? null;
    }
}

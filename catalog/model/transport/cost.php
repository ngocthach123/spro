<?php
class ModelTransportCost extends Model
{
    public function getCost($data)
    {
        $sql = "SELECT gia_van_chuyen, van_chuyen FROM " . DB_PREFIX . "shipping_cost WHERE loai_hang ='".(int)$data['type'] ."' AND dai >='".(float)$data['length'] ."' AND rong >='".(float)$data['width'] ."' AND cao >='".(float)$data['height'] ."' AND khoi_luong >='".(float)$data['weight']."' AND gia_tri >='".(float)$data['total']."'";

        $query = $this->db->query($sql);

        return $query->rows;
    }
}
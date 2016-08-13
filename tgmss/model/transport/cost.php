<?php
class ModelTransportCost extends Model {
    public function addCost($data) {
        $sql ="INSERT INTO " . DB_PREFIX . "shipping_cost SET loai_hang = '" . $data['loai_hang'] . "', khoi_luong ='".(float)$data['khoi_luong']. "', gia_tri ='".(float)$data['gia_don_hang']. "', dai ='".(float)$data['dai']. "', rong ='".(float)$data['rong']. "', cao ='".(float)$data['cao']. "', van_chuyen ='".$data['van_chuyen']. "', gia_van_chuyen ='".(float)$data['gia_van_chuyen']. "', hang_van_chuyen ='".$data['hang_van_chuyen']."'";
//        echo $sql; exit();
        $this->db->query($sql);

        return $this->db->getLastId();
    }

    public function editCost($cost_id, $data) {
        $this->db->query("UPDATE " . DB_PREFIX . "shipping_cost SET loai_hang = '" . $data['loai_hang']. "', khoi_luong ='".(float)$data['khoi_luong']. "', gia_tri ='".(float)$data['gia_don_hang']. "', dai ='".(float)$data['dai']. "', rong ='".(float)$data['rong']. "', cao ='".(float)$data['cao']. "', van_chuyen ='".$data['van_chuyen']. "', gia_van_chuyen ='".(float)$data['gia_van_chuyen']. "', hang_van_chuyen ='".$data['hang_van_chuyen'] . "' WHERE id = '" . (int)$cost_id . "'");
    }

    public function deleteCost($cost_id) {
        $this->db->query("DELETE FROM " . DB_PREFIX . "shipping_cost WHERE id = '" . (int)$cost_id . "'");
    }

    public function getCosts($data = array()) {
        $sql = "SELECT * FROM " . DB_PREFIX . "shipping_cost WHERE 1";

        $sort_data = array(
            'agd.name',
            'ag.sort_order'
        );

        if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
            $sql .= " ORDER BY " . $data['sort'];
        } else {
            $sql .= " ORDER BY loai_hang";
        }

        if (isset($data['order']) && ($data['order'] == 'DESC')) {
            $sql .= " DESC";
        } else {
            $sql .= " ASC";
        }

        if (isset($data['start']) || isset($data['limit'])) {
            if ($data['start'] < 0) {
                $data['start'] = 0;
            }

            if ($data['limit'] < 1) {
                $data['limit'] = 20;
            }

            $sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
        }

        $query = $this->db->query($sql);

        return $query->rows;
    }

    public function getCost($cost_id) {
        $sql = "SELECT * FROM " . DB_PREFIX . "shipping_cost WHERE id =".(int)$cost_id;

        $query = $this->db->query($sql);

        return $query->row;
    }

    public function getTotalCosts() {
        $query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "shipping_cost");

        return $query->row['total'];
    }
}
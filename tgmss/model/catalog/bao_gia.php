<?php
class ModelCatalogBaoGia extends Model {
	public function addReport($data) {
		$this->db->query("INSERT INTO " . DB_PREFIX . "price_report SET customer = '" . $data['customer']. "', work_place = '" . $this->db->escape($data['work_place']). "', address = '" . $this->db->escape($data['address']). "', phone = '" . $this->db->escape($data['phone']). "', email = '" . $this->db->escape($data['email']). "', report_code = '" . $this->db->escape($data['report_code']). "', user_id = '" . $data['user_id']. "', date_added = NOW()");

		$report_id = $this->db->getLastId();

		$i=0;
		foreach ($data['product_rp_id'] as $product_id) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "price_report_detail SET report_id = '" . (int)$report_id . "', product_id = '" . (int)$product_id . "', quantity = '" . (int)$data['quantity_rp'][$i] . "'");
			$i++;
		}

		return $report_id;
	}

	public function editReport($report_id, $data) {

		$this->db->query("UPDATE " . DB_PREFIX . "price_report SET customer = '" . $data['customer']. "', work_place = '" . $this->db->escape($data['work_place']). "', address = '" . $this->db->escape($data['address']). "', phone = '" . $this->db->escape($data['phone']). "', email = '" . $this->db->escape($data['email']). "', report_code = '" . $this->db->escape($data['report_code']). "', user_id = '" . $data['user_id']. "', date_added = NOW() WHERE id='".(int)$report_id."'");

		$this->db->query("DELETE FROM " . DB_PREFIX . "price_report_detail WHERE report_id = '" . (int)$report_id . "'");
		$i=0;
		foreach ($data['product_rp_id'] as $product_id) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "price_report_detail SET report_id = '" . (int)$report_id . "', product_id = '" . (int)$product_id . "', quantity = '" . (int)$data['quantity_rp'][$i] . "'");
			$i++;
		}
	}

	public function deleteReport($report_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "price_report WHERE id = '" . (int)$report_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "price_report_detail WHERE report_id = '" . (int)$report_id . "'");
	}

	public function getProductReports($report_id) {

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "price_report_detail WHERE report_id = " . (int)$report_id);

		return $query->rows;
	}

	public function getReports($data = array()) {
		$sql = "SELECT * FROM " . DB_PREFIX . "price_report WHERE 1";

		$sort_data = array(
			'agd.name',
			'ag.sort_order'
		);

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];
		} else {
			$sql .= " ORDER BY date_added";
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

	public function getReport($reprort_id) {
		$sql = "SELECT * FROM " . DB_PREFIX . "price_report WHERE id =".(int)$reprort_id;

		$query = $this->db->query($sql);

		return $query->row;
	}

	public function getTotalReports() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "price_report");

		return $query->row['total'];
	}
}
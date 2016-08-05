<?php
class ModelCatalogAccessGroup extends Model {
	public function addAccessGroup($data) {
		$this->db->query("INSERT INTO " . DB_PREFIX . "access_group SET name = '" . $data['group_name'] . "'");

		$access_group_id = $this->db->getLastId();

		foreach ($data['product_access'] as $product_id) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "product_accessories SET group_id = '" . (int)$access_group_id . "', product_id = '" . (int)$product_id  . "'");
		}

		return $access_group_id;
	}

	public function editAccessGroup($group_id, $data) {
		$this->db->query("UPDATE " . DB_PREFIX . "access_group SET name = '" . $data['group_name'] . "' WHERE group_id = '" . (int)$group_id . "'");

		$this->db->query("DELETE FROM " . DB_PREFIX . "product_accessories WHERE group_id = '" . (int)$group_id . "'");

		foreach ($data['product_access'] as $product_id) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "product_accessories SET product_id = '" . (int)$product_id . "', group_id = '" . (int)$group_id . "'");
		}
	}

	public function deleteAccessGroup($group_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "access_group WHERE group_id = '" . (int)$group_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_accessories WHERE group_id = '" . (int)$group_id . "'");
	}

	public function getProductAccess($group_id) {
		$product_access_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_accessories WHERE group_id = " . (int)$group_id);

		foreach ($query->rows as $result) {
			$product_access_data[] = $result['product_id'];
		}

		return $product_access_data;
	}

	public function getAccessGroups($data = array()) {
		$sql = "SELECT * FROM " . DB_PREFIX . "access_group WHERE 1";

		$sort_data = array(
			'agd.name',
			'ag.sort_order'
		);

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];
		} else {
			$sql .= " ORDER BY name";
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

	public function getAccessGroup($group_id) {
		$sql = "SELECT * FROM " . DB_PREFIX . "access_group WHERE group_id =".(int)$group_id;

		$query = $this->db->query($sql);

		return $query->row;
	}

	public function getTotalAccessGroups() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "access_group");

		return $query->row['total'];
	}
}
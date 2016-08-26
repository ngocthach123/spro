<?php
class ModelLocalisationZone extends Model {
	public function getZone($zone_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "zone WHERE zone_id = '" . (int)$zone_id . "' AND status = '1'");

		return $query->row;
	}

	public function getZonesByCountryId($country_id) {
	$zone_data = $this->cache->get('zone.' . (int)$country_id);

	if (!$zone_data) {
		$sql ="SELECT * FROM " . DB_PREFIX . "zone WHERE country_id = '" . (int)$country_id . "' AND status = '1' ORDER BY FIELD(zone_id, 4389,4385,4376) DESC, name ASC";

		$query = $this->db->query($sql);

		$zone_data = $query->rows;

		$this->cache->set('zone.' . (int)$country_id, $zone_data);
	}

	return $zone_data;
	}

	public function getDistrictByZoneId($zone_id) {
		$district_data = $this->cache->get('district.' . (int)$zone_id);

		if (!$district_data) {
			$sql ="SELECT district_id, CONCAT(type, ' ',name) as name FROM " . DB_PREFIX . "district WHERE zone_id = '" . (int)$zone_id . "' ORDER BY name";

			$query = $this->db->query($sql);

			$district_data = $query->rows;

			$this->cache->set('district.' . (int)$zone_id, $district_data);
		}

		return $district_data;
	}
}
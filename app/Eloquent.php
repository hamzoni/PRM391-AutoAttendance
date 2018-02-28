<?php

namespace App;

class Eloquent {
	public static function log($status = true, $msg = null) {
		if ($msg == null) return ['status' => $status];
		if (is_array($msg)) {
			if (count($msg) == 0) return ['status' => $status];
			$msg = count($msg) > 1 ? ($status ? $msg[0] : $msg[1]) : $msg[0];
		}
		return [
			'status' => $status,
			'message' => $msg
		];
	}
}
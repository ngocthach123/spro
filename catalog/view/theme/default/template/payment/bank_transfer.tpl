<div class="bthongtinchuyenkhoan">
	<div class="txtthongtinchuyenkhoan">
		Thông tin chuyển khoản
	</div>
	<div class="contentthongtinchuyenkhoan">
		<p>(Dành cho khách hàng chọn phương thức thanh toán chuyển khoản qua ngân hàng)</p>
		<b class="txttknh">Thông tin tài khoản ngân hàng:</b>
		<div class="thongtinchutaikhoan">
			<p><?php echo $bank; ?></p>
			<p><?php echo $text_payment; ?></p>
		</div>

	</div>
</div>

<script type="text/javascript"><!--

	$.ajax({
		type: 'get',
		url: 'index.php?route=payment/bank_transfer/confirm',
		cache: false,
		success: function() {

		}
	});

//--></script>

<?php echo $header; ?>
<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <?php if ($success) { ?>
  <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?></div>
  <?php } ?>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?> index-customer"><?php echo $content_top; ?>

      <h2>Bảng thông tin của tôi</h2>
      <div class="col-sm-6">
        <span class="title">Thông tin tài khoản</span>
        <a href="<?php echo $edit;?>" class="pull-right">Chỉnh sửa ></a>
        <table class="customer-info" cellpadding="10" cellspacing="10">
          <tr>
            <td>Họ và tên:</td>
            <td><?php echo $firstname;?></td>
          </tr>
          <tr>
            <td> Email:</td>
            <td><?php echo $email;?></td>
          </tr>
          <tr>
            <td> SDT:</td>
            <td><?php echo $telephone;?></td>
          </tr>
        </table>
      </div>

      <div class=" col-sm-12">
        <div class="wrap-title">
          <span class="title">Các đơn hàng vừa đặt</span>
        </div>
        <?php if($orders): ?>
          <table class="table table-bordered table-hover">
          <thead>
          <tr>
            <td class="text-right">Mã đơn hàng</td>
            <td class="text-left">Khách hàng</td>
            <td class="text-right">Số sản phẩm</td>
            <td class="text-left">Tình trạng</td>
            <td class="text-right">Tổng cộng</td>
            <td class="text-left">Ngày tạo</td>
            <td></td>
          </tr>
          </thead>
          <tbody>
          <?php foreach ($orders as $order) { ?>
          <tr>
            <td class="text-right">#<?php echo $order['order_id']; ?></td>
            <td class="text-left"><?php echo $order['name']; ?></td>
            <td class="text-right"><?php echo $order['products']; ?></td>
            <td class="text-left"><?php echo $order['status']; ?></td>
            <td class="text-right"><?php echo $order['total']; ?></td>
            <td class="text-left"><?php echo $order['date_added']; ?></td>
            <td class="text-right"><a href="<?php echo $order['view']; ?>" data-toggle="tooltip" title="Xem" class="btn btn-info"><i class="fa fa-eye"></i></a></td>
          </tr>
          <?php } ?>
          </tbody>
        </table>
        <?php else:?>
          <p>Bạn chưa có đơn hàng nào.</p>
        <?php endif;?>
      </div>

      <div class="col-sm-11">
        <div class="wrap-title">
          <span class="title">Sổ địa chỉ</span>
          <a href="<?php echo $address;?>" class="pull-right">Xem tất cả ></a>
        </div>
        <?php if($addresses): ?>
          <?php foreach ($addresses as $result) { ?>
            <div class="col-sm-6">
              <div class="block-address">
                <?php if($result['default']): ?>
                  <span class="pull-right text-green">Mặc định</span>
                <?php endif;?>
                <span>Địa chỉ: </span>
                <span><?php echo $result['address']; ?></span> <br/>
                <span>Điện thoại: </span>
                <span><?php echo $result['telephone']; ?></span><br/>
                <a class="btn btn-default" href="<?php echo $result['update']; ?>">Sửa</a>
                <a class="btn btn-danger" href="<?php echo $result['delete']; ?>">Xóa</a>
              </div>
            </div>
          <?php } ?>
        <?php else:?>
          <p>Bạn chưa có sổ địa chỉ nào.</p>
        <?php endif;?>
      </div>

      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?> 
<div class="panel panel-default statistical">
  <div class="panel-heading bdbn">
    <h3 class="panel-title boxsale-home"><i class="fa fa-caret-right"></i> <?php echo $heading_title; ?>
      (<a target="_blank" href="<?php echo $viewall; ?>">Xem toàn bộ danh sách</a>)
    </h3>
  </div>
  <div class="table-responsive">
    <table class="table table-bordered tablesale-home">
      <thead>
        <tr>
          <td><?php echo $column_order_id; ?></td>
          <td><?php echo $column_customer; ?></td>
          <td class="hidden"><?php echo $column_status; ?></td>
          <td><?php echo $column_date_added; ?></td>
          <td class="text-right"><?php echo $column_total; ?></td>
          <td class="text-right"><?php echo $column_action; ?></td>
        </tr>
      </thead>
      <tbody>
        <?php if ($orders) { ?>
        <?php foreach ($orders as $order) { ?>
        <tr>
          <td><?php echo $order['order_id']; ?></td>
          <td><?php echo $order['customer']; ?></td>
          <td class="hidden"><?php echo $order['status']; ?></td>
          <td><?php echo $order['date_added']; ?></td>
          <td class="text-right"><?php echo $order['total']; ?></td>
          <td class="text-right"><a href="<?php echo $order['view']; ?>" data-toggle="tooltip" title="<?php echo $button_view; ?>" class="btn btn-info"><i class="fa fa-eye"></i></a></td>
        </tr>
        <?php } ?>
        <?php } else { ?>
        <tr>
          <td class="text-center" colspan="6"><?php echo $text_no_results; ?></td>
        </tr>
        <?php } ?>
      </tbody>
    </table>
  </div>
</div>

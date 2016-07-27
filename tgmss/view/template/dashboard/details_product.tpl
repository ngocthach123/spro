<div class="panel panel-default boxsalelast-home pdproduct-home">
  <ul class="nav nav-tabs navproduct-home">
    <li class="active"><a data-toggle="tab" href="#viewproduct"><?php echo $tag_viewproduct; ?></a></li>
    <li><a data-toggle="tab" href="#purchaseproduct"><?php echo $tag_purchaseproduct; ?></a></li>
  </ul>
  <div class="tab-content">
    <!-- view product -->
    <div id="viewproduct" class="tab-pane fade in active">
    <p>Các sản phẩm được xem nhiều nhất trong 30 ngày qua - <a class="dtproduct-home" href="<?php echo $viewall; ?>">Xem danh sách</a></p>
      <div class="table-responsive">
        <table class="table table-bordered tableproduct-home">
          <thead>
            <tr>
              <td><?php echo $column_product; ?></td>
              <td><?php echo $column_model; ?></td>
              <td><?php echo $column_view; ?></td>
            </tr>
          </thead>
          <tbody>
            <?php if ($viewproducts) { ?>
            <?php foreach ($viewproducts as $viewproduct) { ?>
            <tr>
              <td><?php echo $viewproduct['name']; ?></td>
              <td><?php echo $viewproduct['model']; ?></td>
              <td><?php echo $viewproduct['viewed']; ?></td>
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
    <!-- purchase product -->
    <div id="purchaseproduct" class="tab-pane fade">
      <div class="table-responsive">
        <table class="table table-bordered tableproduct-home">
          <thead>
            <tr>
              <td><?php echo $column_product; ?></td>
              <td><?php echo $column_model; ?></td>
              <td><?php echo $column_quantity; ?></td>
              <td><?php echo $column_total; ?></td>
            </tr>
          </thead>
          <tbody>
            <?php if ($purchaseproducts) { ?>
            <?php foreach ($purchaseproducts as $purchaseproduct) { ?>
            <tr>
              <td><?php echo $purchaseproduct['name']; ?></td>
              <td><?php echo $purchaseproduct['model']; ?></td>
              <td><?php echo $purchaseproduct['quantity']; ?></td>
              <td><?php echo $purchaseproduct['total']; ?></td>
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
    <!-- end purchase product -->
  </div>
</div>

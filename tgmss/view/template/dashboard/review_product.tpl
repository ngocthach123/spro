<div class="panel panel-default boxsalelast-home statistical">
  <div class="panel-heading bdbn">
    <h3 class="panel-title boxsale-home"><i class="fa fa-caret-right"></i> <?php echo $heading_title; ?>
      (<a target="_blank" href="<?php echo $viewall; ?>">Xem toàn bộ danh sách</a>)
    </h3>
  </div>
  <div class="table-responsive">
    <table class="table table-bordered tablesale-home">
      <thead>
        <tr>
          <td><?php echo $column_id; ?></td>
          <td><?php echo $column_product; ?></td>
          <td><?php echo $column_author; ?></td>
          <td><?php echo $column_text; ?></td>
          <td class="hidden"><?php echo $column_status; ?></td>
          <td class="text-right"><?php echo $column_date_added; ?></td>
          <td class="text-right"><?php echo $column_action; ?></td>
        </tr>
      </thead>
      <tbody>
        <?php if ($reviewproducts) { ?>
        <?php foreach ($reviewproducts as $reviewproduct) { ?>
        <tr>
          <td><?php echo $reviewproduct['review_id']; ?></td>
          <td><?php echo $reviewproduct['name']; ?></td>
          <td><?php echo $reviewproduct['author']; ?></td>
          <td><?php echo $reviewproduct['text']; ?></td>
          <td class="text-right hidden"><?php echo $reviewproduct['status']; ?></td>
          <td class="text-right"><?php echo $reviewproduct['date_added']; ?></td>
          <td class="text-right"><a href="<?php echo $reviewproduct['edit']; ?>" data-toggle="tooltip" title="<?php echo $button_edit; ?>" class="btn btn-primary"><i class="fa fa-pencil"></i></a></td>
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

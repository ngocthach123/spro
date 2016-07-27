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
          <td><?php echo $column_id; ?></td>
          <td><?php echo $column_author; ?></td>
          <td><?php echo $column_text; ?></td>
          <td class="hidden"><?php echo $column_status; ?></td>
          <td class="text-right"><?php echo $column_date_added; ?></td>
          <td class="text-right"><?php echo $column_action; ?></td>
        </tr>
      </thead>
      <tbody>
        <?php if ($reviewstores) { ?>
        <?php foreach ($reviewstores as $reviewstore) { ?>
        <tr>
          <td><?php echo $reviewstore['review_id']; ?></td>
          <td><?php echo $reviewstore['author']; ?></td>
          <td><?php echo $reviewstore['text']; ?></td>
          <td class="text-right hidden"><?php echo $reviewstore['status']; ?></td>
          <td class="text-right"><?php echo $reviewstore['date_added']; ?></td>
          <td class="text-right"><a href="<?php echo $reviewstore['edit']; ?>" data-toggle="tooltip" title="<?php echo $button_edit; ?>" class="btn btn-primary"><i class="fa fa-pencil"></i></a></td>
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

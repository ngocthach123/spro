<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right"><a href="<?php echo $add; ?>" data-toggle="tooltip" title="<?php echo $button_add; ?>" class="btn btn-primary"><i class="fa fa-plus"></i></a>
        <button type="button" data-toggle="tooltip" title="<?php echo $button_delete; ?>" class="btn btn-danger" onclick="confirm('<?php echo $text_confirm; ?>') ? $('#form-option').submit() : false;"><i class="fa fa-trash-o"></i></button>
      </div>
      <h1><span class="iconfa"><i class="fa fa-credit-card"></i></span> <?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <?php if ($success) { ?>
    <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading hidden">
        <h3 class="panel-title"><i class="fa fa-list"></i> <?php echo $text_list; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form-option">
          <div class="table-responsive">
            <table class="table table-hover">
              <thead>
                <tr>
                  <td style="width: 1px;" class="text-center"><input type="checkbox" onclick="$('input[name*=\'selected\']').prop('checked', this.checked);" /></td>
                  <td class="text-left"><?php echo $column_report_code; ?></td>
                  <td class="text-left"><?php echo $column_customer; ?></td>
                  <td class="text-left"><?php echo $column_phone; ?></td>
                  <td class="text-left"><?php echo $column_email; ?></td>
                  <td class="text-left"><?php echo $column_date; ?></td>
                  <td class="text-right"><?php echo $column_action; ?></td>
                </tr>
              </thead>
              <tbody>
                <?php if ($reports) { ?>
                <?php foreach ($reports as $report) { ?>
                <tr>
                  <td class="text-center">
                    <input type="checkbox" name="selected[]" value="<?php echo $report['id']; ?>" />
                 </td>

                  <td class="text-left"><?php echo $report['report_code']; ?></td>
                  <td class="text-left"><?php echo $report['customer']; ?></td>
                  <td class="text-left"><?php echo $report['phone']; ?></td>
                  <td class="text-left"><?php echo $report['email']; ?></td>
                  <td class="text-left"><?php echo $report['date_added']; ?></td>
                  <td class="text-right">
                    <a href="<?php echo $report['edit']; ?>" data-toggle="tooltip" title="<?php echo $button_edit; ?>" class="btn btn-primary"><i class="fa fa-pencil"></i></a>
                    <a href="<?php echo $report['exportpdf']; ?>" data-toggle="tooltip" title="Xuất PDF" class="btn btn-danger"><i class="fa fa-file-pdf-o"></i></a>
                    <a href="<?php echo $report['exportexcel']; ?>" data-toggle="tooltip" title="Xuất Excel" class="btn btn-success"><i class="fa fa-file-excel-o"></i></a>
                  </td>
                </tr>
                <?php } ?>
                <?php } else { ?>
                <tr>
                  <td class="text-center" colspan="3"><?php echo $text_no_results; ?></td>
                </tr>
                <?php } ?>
              </tbody>
            </table>
          </div>
        </form>
        <div class="row">
          <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
          <div class="col-sm-6 text-right"><?php echo $results; ?></div>
        </div>
      </div>
    </div>
  </div>
</div>
<?php echo $footer; ?>
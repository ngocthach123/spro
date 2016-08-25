<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right"><a href="<?php echo $add; ?>" data-toggle="tooltip" title="<?php echo $button_add; ?>" class="btn btn-primary"><i class="fa fa-plus"></i></a>
        <button type="button" data-toggle="tooltip" title="<?php echo $button_copy; ?>" class="btn btn-default" onclick="$('#form-article').attr('action', '<?php echo $copy; ?>').submit()"><i class="fa fa-copy"></i></button>
        <button type="button" data-toggle="tooltip" title="<?php echo $button_delete; ?>" class="btn btn-danger" onclick="confirm('<?php echo $text_confirm; ?>') ? $('#form-article').submit() : false;"><i class="fa fa-trash-o"></i></button>
      </div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-list"></i> Get News Pro</h3>
      </div>
      <div class="panel-body">
      	<div class="well">
      		<div class="row">
        		<div class="col-sm-3">News version: 2.1.2</div>
        		<div class="col-sm-3">Update: 28/1/2016 Lasted</div>
        		<div class="col-sm-3">Get News Pro: <a href="http://www.opencart.com/index.php?route=extension/extension/info&extension_id=25511">Download</a></div>
        	</div>
      	</div>
        <div class="well">
          <div class="row">
          	<div class="col-sm-6">
          		Featured in Pro:
          		<ul>
          			<li>Article Set</li>
          			<li>Multilanguage and Multistore</li>
          			<li>SEO</li>
          			<li>More than.....</li>
          		</ul>
          	</div>
          	<div class="col-sm-6">
          		<ul>
          			<li>Contact: <a href="mailto:vdhoangson@gmail">vdhoangson@gmail.com</a></li>
          		</ul>
          	</div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<?php echo $footer; ?>
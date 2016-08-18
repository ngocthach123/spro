<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
	<div class="page-header">
		<div class="container-fluid">
			<div class="pull-right">
				<a href="<?php echo $insert; ?>" data-toggle="tooltip" title="<?php echo $button_add; ?>" class="btn btn-primary"><i class="fa fa-plus"></i></a>
				<button type="button" data-toggle="tooltip" title="<?php echo $button_copy; ?>" class="btn btn-default" onclick="$('#form-news').attr('action', '<?php echo $copy; ?>').submit()"><i class="fa fa-copy"></i></button>
				<button type="button" data-toggle="tooltip" title="<?php echo $button_delete; ?>" class="btn btn-danger" onclick="confirm('<?php echo $text_confirm; ?>') ? $('#form-news').submit() : false;"><i class="fa fa-trash-o"></i></button>
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
				<div class="row">
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
						<div class="input-group">
							<span class="input-group-addon" id="sizing-addon1">Tìm kiếm</span>
							<input type="text" name="filter_name" value="<?php echo $filter_name; ?>" class="form-control" placeholder="Nhập tên sản phẩm cần tìm kiếm...">
							<span class="input-group-btn">
								<button type="button" id="button-filter" class="btn btn-filter mtbuttonn"><i class="fa fa-search"></i> <?php echo $button_filter; ?></button>
							</span>
						</div>
					</div>
				</div>
				<div class="well hidden">
					<div class="row">
						<div class="col-sm-4">
							<div class="form-group">
								<label class="control-label" for="input-name"><?php echo $entry_name; ?></label>
								<input type="text" name="filter_name" value="<?php echo $filter_name; ?>" placeholder="<?php echo $entry_name; ?>" id="input-name" class="form-control" />
							</div>
							<div class="form-group">
								<label class="control-label"><?php echo $entry_category; ?></label>
								<select name="filter_category" class="form-control">
									<option value="0"></option>
									<?php foreach ($categories as $category) {?>
									<?php if ($category['cat_id']==$filter_cat_id) { ?>
									<option value="<?php echo $category['cat_id']; ?>" selected="selected"><?php echo $category['name']; ?></option>
									<?php } else { ?>
									<option value="<?php echo $category['cat_id']; ?>"><?php echo $category['name']; ?></option> 
									<?php } ?>
									<?php } ?>
								</select>
							</div>
						</div>
						<div class="col-sm-4">
							<div class="form-group">
								<label class="control-label"><?php echo $entry_dated; ?></label>
								<select name="date_modified" class="form-control">
									<option value="0"></option>
									<option value="DESC">Giảm dần theo thời gian</option>
									<option value="ASC">Tăng dần theo thời gian</option> 
								</select>
							</div>
							<div class="form-group">
								<label class="control-label"><?php echo $entry_status; ?></label>
								<select name="filter_status" class="form-control">
									<option value="*"></option>
									<?php if ($filter_status) { ?>
									<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
									<?php } else { ?>
									<option value="1"><?php echo $text_enabled; ?></option>
									<?php } ?>
									<?php if (!is_null($filter_status) && !$filter_status) { ?>
									<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
									<?php } else { ?>
									<option value="0"><?php echo $text_disabled; ?></option>
									<?php } ?>
								</select>
							</div>
						</div>
						<div class="col-sm-4">
							<button type="button" id="button-filter" class="btn btn-primary pull-right"><i class="fa fa-search"></i> <?php echo $button_filter; ?></button>
						</div>
					</div>
				</div>
				<form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form-news">
					<div class="table-responsive">
						<table class="table table-hover">
							<thead>
								<tr>
									<td style="width: 1px;" class="text-center"><input type="checkbox" onclick="$('input[name*=\'selected\']').prop('checked', this.checked);" /></td>
									<td class="text-center"><?php echo $column_image; ?></td>
									<td class="text-left">
										<?php if ($sort == 'pd.name') { ?>
										<a href="<?php echo $sort_name; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_name; ?></a>
										<?php } else { ?>
										<a href="<?php echo $sort_name; ?>"><?php echo $column_name; ?></a>
										<?php } ?>
									</td>
									<td class="text-center">Thời gian</td>
									<td class="text-center"><?php if ($sort == 'p.status') { ?>
										<a href="<?php echo $sort_status; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_status; ?></a>
										<?php } else { ?>
										<a href="<?php echo $sort_status; ?>"><?php echo $column_status; ?></a>
										<?php } ?>
									</td>
									<td class="text-right"><?php echo $column_action; ?></td>
								</tr>
							</thead>
							<tbody>
								<?php if ($newss) { ?>
								<?php foreach ($newss as $news) { ?>
								<tr>
									<td class="text-center">
										<?php if (in_array($news['news_id'], $selected)) { ?>
										<input type="checkbox" name="selected[]" value="<?php echo $news['news_id']; ?>" checked="checked" />
										<?php } else { ?>
										<input type="checkbox" name="selected[]" value="<?php echo $news['news_id']; ?>" />
										<?php } ?>
									</td>
									<td class="text-center">
										<?php if ($news['image']) { ?>
										<img src="<?php echo $news['image']; ?>" alt="<?php echo $news['name']; ?>" class="img-thumbnail" />
										<?php } else { ?>
										<span class="img-thumbnail list"><i class="fa fa-camera fa-2x"></i></span>
										<?php } ?>
									</td>
									<td class="text-left"><?php echo $news['name']; ?></td>
									<td class="text-center"><?php echo $news['date_modified']; ?></td>
									<td class="text-center"><?php echo $news['status']; ?></td>
									<td class="text-right">
										<a href="<?php echo $news['edit']; ?>" data-toggle="tooltip" title="<?php echo $button_edit; ?>" class="btn btn-primary"><i class="fa fa-pencil"></i></a>
									</td>
								</tr>
								<?php } ?>
								<?php } else { ?>
								<tr>
									<td class="text-center" colspan="8"><?php echo $text_no_results; ?></td>
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
<script type="text/javascript"><!--
$('#button-filter').on('click', function() {
	var url = 'index.php?route=content/news&token=<?php echo $token; ?>';

	var filter_name = $('input[name=\'filter_name\']').val();

	if (filter_name) {
		url += '&filter_name=' + encodeURIComponent(filter_name);
	}

	var filter_category = $('select[name=\'filter_category\']').val();
	
	if (filter_category) {
		url += '&filter_category=' + encodeURIComponent(filter_category);
	}

	var filter_date = $('select[name=\'date_modified\']').val();
		
	if (filter_date != '0') {
		url += '&filter_date=' + encodeURIComponent(filter_date);
	}    

	var filter_status = $('select[name=\'filter_status\']').val();

	if (filter_status != '*') {
		url += '&filter_status=' + encodeURIComponent(filter_status);
	}

	location = url;
});
//--></script>
<script type="text/javascript"><!--
	$('input[name=\'filter_name\']').autocomplete({
		'source': function(request, response) {
			$.ajax({
				url: 'index.php?route=content/news/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
				dataType: 'json',
				success: function(json) {		
					response($.map(json, function(item) {
						return {
							label: item['name'],
							value: item['news_id']
						}
					}));
				}
			});
		}, 
		'select': function(item) {
			$('input[name=\'filter_name\']').val(item['label']);
		}
	});
//--></script> 
</div>
<?php echo $footer; ?>
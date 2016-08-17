<?php echo $header; ?>
<div class="container">
	<ul class="breadcrumb">
		<?php foreach ($breadcrumbs as $breadcrumb) { ?>
		<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
		<?php } ?>
	</ul>
	<div class="row">
		<?php echo $column_left; ?>
		<?php if ($column_left && $column_right) { ?>
		<?php $class = 'col-sm-6'; ?>
		<?php } elseif ($column_left || $column_right) { ?>
		<?php $class = 'col-sm-9'; ?>
		<?php } else { ?>
		<?php $class = 'col-sm-12'; ?>
		<?php } ?>
		<div id="content" class="<?php echo $class; ?>">
			<h2><?php echo $name; ?></h2>
			<div class="date-add-detail">
				<span class="badge"><?php echo "Đăng ngày ";?> <?php echo $date1; ?></span> 
				<span class="badge"><?php echo "lúc: ";?> <?php echo $date2; ?></span>
			</div>
			<?php if ($thumb || $images) { ?>
			<div class="row hidden">
				<div class=" col-md-6 col-md-offset-3 col-sm-12 col-xs-12">
					<ul class="thumbnails">
						<?php if ($thumb) { ?>
						<li><a class="thumbnail" href="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>"><img src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a></li>
						<?php } ?>
						<?php if ($images) { ?>
						<?php foreach ($images as $image) { ?>
						<li class="image-additional"><a class="thumbnail" href="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>"> <img src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a></li>
						<?php } ?>
						<?php } ?>
					</ul>
				</div>
			</div>
			<?php } ?>
			<?php echo $content_top; ?>
			<div class="newsdescription-page">
				<?php echo $description; ?>
				<?php if(isset($filename) && ($filename!="")) { ?>
				<div class='download'> 
					<img src='<?php echo HTTPS_IMAGE ;?>/download.png'/> &nbsp; <a href="<?php echo $hreldownload ?>"><?php echo $text_download;?></a>
				</div>
				<?php } ?>
				<!-- AddThis Button BEGIN -->
				<div class="addthis_toolbox addthis_default_style" data-url="<?php echo $share; ?>"><a class="addthis_button_facebook_like" fb:like:layout="button_count"></a> <a class="addthis_button_tweet"></a> <a class="addthis_button_pinterest_pinit"></a> <a class="addthis_counter addthis_pill_style"></a></div>
				<script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-515eeaf54693130e"></script>
				<!-- AddThis Button END -->
			</div>
			<?php if ($newss) { ?>
			<h3><?php echo $tab_related; ?></h3>
			<ul>
			<?php foreach ($newss as $news) { ?>
			<li> 
				<a href="<?php echo $news['href']; ?>" style="font-size:11px;font-weight:bold;"><?php echo $news['name']; ?> </a> 
			</li>
			<?php } ?>
			</ul>              
			<?php } ?> 
			<?php if ($tinlienquan) { ?>
			<h3>Các tin tức khách</h3>
			<ul>
			<?php foreach ($tinlienquan as $tlq) { ?>
				<li>
					<a href="<?php echo $tlq['href'];?>"><?php echo $tlq['name']?></a>
				</li>
			<?php }?>  
			</ul>
			<?php } ?>
			<?php if ($tags) { ?>
			<p>
				<?php echo $text_tags; ?>
				<?php foreach ($tags as $tag) { ?>
				<a href="<?php echo $tag['href']; ?>"><?php echo $tag['tag']; ?></a>,
				<?php } ?>
			</p>
			<?php } ?>  			
			<?php if ($comment_status) { ?>
			<div class="tab-pane hidden" id="tab-review">
				<form class="form-horizontal" id="form-review">
					<div id="review"></div>
					<h2><?php echo $text_write; ?></h2>
					<div class="form-group required">
						<div class="col-sm-12">
							<label class="control-label" for="input-name"><?php echo $entry_name; ?></label>
							<input type="text" name="name" id="input-name" class="form-control" />
						</div>
					</div>
					<div class="form-group required">
						<div class="col-sm-12">
							<label class="control-label" for="input-review"><?php echo $entry_review; ?></label>
							<textarea name="text" rows="5" id="input-review" class="form-control"></textarea>
							<div class="help-block"><?php echo $text_note; ?></div>
						</div>
					</div>
					<div class="form-group required">
						<div class="col-sm-12">
							<label class="control-label"><?php echo $entry_rating; ?></label>
							&nbsp;&nbsp;&nbsp; <?php echo $entry_bad; ?>&nbsp;
							<input type="radio" name="rating" value="1" />
							&nbsp;
							<input type="radio" name="rating" value="2" />
							&nbsp;
							<input type="radio" name="rating" value="3" />
							&nbsp;
							<input type="radio" name="rating" value="4" />
							&nbsp;
							<input type="radio" name="rating" value="5" />
							&nbsp;<?php echo $entry_good; ?>
						</div>
					</div>
					<?php echo $captcha; ?>
					<div class="buttons clearfix">
						<div class="pull-right">
							<button type="button" id="button-review" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary"><?php echo $button_continue; ?></button>
						</div>
					</div>
				</form>
			</div>
			<?php } ?>
		<?php echo $content_bottom; ?>
		</div>
	<?php echo $column_right; ?>
	</div>
	<script type="text/javascript"><!--
	$('#review').delegate('.pagination a', 'click', function(e) {
		e.preventDefault();
		
		$('#review').fadeOut('slow');
		$('#review').load(this.href);
		$('#review').fadeIn('slow');
	});

	$('#review').load('index.php?route=content/news/comment&news_id=<?php echo $news_id; ?>');

	$('#button-review').on('click', function() {
		$.ajax({
			url: 'index.php?route=content/news/write&news_id=<?php echo $news_id; ?>',
			type: 'post',
			dataType: 'json',
			data: $("#form-review").serialize(),
			beforeSend: function() {
				$('#button-review').button('loading');
			},
			complete: function() {
				$('#button-review').button('reset');
			},
			success: function(json) {
				$('.alert-success, .alert-danger').remove();

				if (json['error']) {
					$('#review').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
				}

				if (json['success']) {
					$('#review').after('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');

					$('input[name=\'name\']').val('');
					$('textarea[name=\'text\']').val('');
					$('input[name=\'rating\']:checked').prop('checked', false);
				}
			}
		});
	});

	$(document).ready(function() {
		$('.thumbnails').magnificPopup({
			type:'image',
			delegate: 'a',
			gallery: {
				enabled:true
			}
		});
	});
	//--></script>
</div>
<?php echo $footer; ?>
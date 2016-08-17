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
		<div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
			<h2><?php echo $heading_title; ?></h2>
			<?php if ($thumb || $description) { ?>
			<div class="row">
				<?php if ($thumb) { ?>
				<div class="col-sm-2"><img src="<?php echo $thumb; ?>" alt="<?php echo $heading_title; ?>" title="<?php echo $heading_title; ?>" class="img-thumbnail" /></div>
				<?php } ?>
				<?php if ($description) { ?>
				<div class="col-sm-10"><?php echo $description; ?></div>
				<?php } ?>
			</div>
			<hr>
			<?php } ?>
			<?php if ($categories) { ?>
			<h3><?php echo $text_refine; ?></h3>
			<?php if (count($categories) <= 5) { ?>
			<div class="row">
				<div class="col-sm-3">
					<ul>
						<?php foreach ($categories as $category) { ?>
						<li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
						<?php } ?>
					</ul>
				</div>
			</div>
			<?php } else { ?>
			<div class="row">
				<?php foreach (array_chunk($categories, ceil(count($categories) / 4)) as $categories) { ?>
				<div class="col-sm-3">
					<ul>
						<?php foreach ($categories as $category) { ?>
						<li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
						<?php } ?>
					</ul>
				</div>
				<?php } ?>
			</div>
			<?php } ?>
			<?php } ?>
			<?php if ($newss) { ?>
			<div class="row">
				<?php foreach ($newss as $news) { ?>
				<div class="news-list col-md-12 col-sm-12 col-xs-12">
					<div class="news-thumb">
						<div class="image">
							<a href="<?php echo $news['href']; ?>"><img src="<?php echo $news['thumb']; ?>" alt="<?php echo $news['name']; ?>" title="<?php echo $news['name']; ?>" class="img-responsive" /></a>
						</div>
						<div>
							<div class="caption">
								<h4><a href="<?php echo $news['href']; ?>"><?php echo $news['name']; ?></a></h4>
								<p><?php echo $news['description1']; ?></p>
								<div class="date-add">
									<?php echo "Đăng ngày";?><?php echo $news['date1']; ?>
									<?php echo "Lúc";?> <?php echo $news['date2']; ?>
								</div>
							</div>
						</div>
					</div>
				</div>
				<?php } ?>
			</div>
			<div class="row">
				<div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
				<div class="col-sm-6 text-right"><?php echo $results; ?></div>
			</div>
			<?php } ?>
			<?php if (!$categories && !$newss) { ?>
			<p><?php echo $text_empty; ?></p>
			<div class="buttons">
				<div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
			</div>
			<?php } ?>
			<?php echo $content_bottom; ?>
		</div> 
		<?php echo $column_right; ?>
	</div>
</div>
<?php echo $footer; ?>
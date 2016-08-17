<h3><?php echo $heading_title; ?></h3>
<div class="row">
	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
		<?php foreach ($newss as $news) { ?>
		<div class="news-list">
			<div class="news-thumb transition">
				<div class="image">
					<a href="<?php echo $news['href']; ?>"><img src="<?php echo $news['thumb']; ?>" alt="<?php echo $news['name']; ?>" title="<?php echo $news['name']; ?>" class="img-responsive" /></a>
				</div>
				<div class="caption">
					<h4><a href="<?php echo $news['href']; ?>"><?php echo $news['name']; ?></a></h4>
					<p><?php echo $news['description']; ?></p>
				</div>
			</div>
		</div>
		<?php } ?>
	</div>
</div>

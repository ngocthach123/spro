<?php if ($reviews) { ?>
<ul class="nav nav-tabs navcacnhanxetdd">
  <li class="active"><a data-toggle="tab" href="#nhanxethuuich-product" aria-expanded="true">Nhận xét hữu ích</a></li>
  <li class=""><a data-toggle="tab" href="#nhanxetmoinhat-product" aria-expanded="false">Nhận xét mới nhất</a></li>
</ul>
<div class="tab-content">
  <div id="nhanxethuuich-product" class="tab-pane fade active in">
    <?php foreach ($reviews_rating as $review): ?>
    <div class="noidungnhanxet">
      <div class="nguoinhanxet">
        <img src="image/user.png"/><br><br>
        <span><?php echo $review['author']; ?></span><br>
        <?php echo $review['date_added']; ?><br>
      </div>
      <div class="noidungnguoinhanxet">
        <?php for ($i = 1; $i <= 5; $i++) { ?>
        <?php if ($review['rating'] < $i) { ?>
        <span class="fa fa-stack star-grey"><i class="fa fa-star-o fa-stack-2x"></i></span>
        <?php } else { ?>
        <span class="fa fa-stack star-yelow"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
        <?php } ?>
        <?php } ?>

        <p><?php echo $review['text']; ?></p>
        <span class="nxdco"><b>7 người</b> đã cảm ơn nhận xét này. </span><span class="nxhhk">Nhận xét này hữu ích với bạn?</span> <a class="camon" href="#"><i class="fa fa-thumbs-o-up"></i> Cảm ơn</a>
      </div>
    </div>
    <?php endforeach; ?>
    <div class="pagination-nhanxet">
      <?php echo $pagination; ?>
    </div><!-- end pagination-nhanxet -->
  </div><!-- end nhanxethuuich-product -->
  <div id="nhanxetmoinhat-product" class="tab-pane fade">
    <?php foreach ($reviews as $review): ?>
    <div class="noidungnhanxet">
      <div class="nguoinhanxet">
        <img src="image/user.png"/><br><br>
        <span><?php echo $review['author']; ?></span><br>
        <?php echo $review['date_added']; ?><br>
      </div>
      <div class="noidungnguoinhanxet">
        <?php for ($i = 1; $i <= 5; $i++) { ?>
        <?php if ($review['rating'] < $i) { ?>
        <span class="fa fa-stack star-grey"><i class="fa fa-star-o fa-stack-2x"></i></span>
        <?php } else { ?>
        <span class="fa fa-stack star-yelow"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
        <?php } ?>
        <?php } ?>

        <p><?php echo $review['text']; ?></p>
        <span class="nxdco"><b>7 người</b> đã cảm ơn nhận xét này. </span><span class="nxhhk">Nhận xét này hữu ích với bạn?</span> <a class="camon" href="#"><i class="fa fa-thumbs-o-up"></i> Cảm ơn</a>
      </div>
    </div>
    <?php endforeach; ?>
    <div class="pagination-nhanxet">
      <?php echo $pagination; ?>
    </div><!-- end pagination-nhanxet -->
  </div><!-- end nhanxetmoinhat-product -->
</div><!-- end tab-content -->
<?php } else { ?>
  <p><?php echo $text_no_reviews; ?></p>
<?php } ?>


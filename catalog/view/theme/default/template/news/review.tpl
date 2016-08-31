<?php if ($reviews) { ?>

  <div id="nhanxetmoinhat-product" class="tab-pane">
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
          <span class="nxdco" id="wrap-textlike<?php echo $review['review_id'];?>">
             <?php if($review['likes']): ?>
            <b><span id="text_likes<?php echo $review['review_id'];?>"><?php echo $review['likes'];?></span> người</b> đã cảm ơn nhận xét này.
            <?php endif;?>
          </span>

      <input type="hidden" value="<?php echo $review['likes'];?>" id="num_likes<?php echo $review['review_id'];?>"/>
        <span id="wrap-btnlike">
          <span class="nxhhk">Nhận xét này hữu ích với bạn?</span> <a class="camon like" review-id="<?php echo $review['review_id'];?>"><i class="fa fa-thumbs-o-up"></i> Cảm ơn</a>
        </span>
    </div>
  </div>
  <?php endforeach; ?>
  <div class="pagination-nhanxet">
    <?php echo $pagination; ?>
  </div><!-- end pagination-nhanxet -->
</div><!-- end nhanxetmoinhat-product -->

<script>
  $('.like').click(function(){
    var review_id = $(this).attr('review-id');
    $.ajax({
      url: 'index.php?route=news/article/like',
      type: 'post',
      dataType: 'text',
      data:{
        review_id: review_id,
      },
      success: function(result) {
        if($('#num_likes'+review_id).val() == 0){
          var html =  "<b><span id='text_likes'>1</span> người</b> đã cảm ơn nhận xét này.";
          $('#wrap-textlike'+review_id).html(html);
        }else {
          $('#text_likes'+review_id).html(parseInt($('#num_likes'+review_id).val())+1);
        }
      },
      error: function(xhr, ajaxOptions, thrownError) {
        alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
      }
    });

    $(this).parent().fadeOut('slow');
  });
</script>


<?php } else { ?>
<p><?php echo $text_no_reviews; ?></p>
<?php } ?>


<div id="search" class="input-group">
  <span class="input-group-addon labeltop-search" id="inputtop-search"><span id="cat-text">Tất cả</span> <span class="caret"></span>
    <input type="hidden" id="cat_id" name="category_id" value=""/>
   <ul class="dropdown-menu" id="select-cattop">
       <li><a class="cat-id" id="0">Tất cả</a></li>
     <?php foreach($categories as $category): ?>
      <li><a class="cat-id" id="<?php echo $category['category_id'];?>"><?php echo $category['name'];?></a></li>
    <?php endforeach;?>
    </ul>
  </span>
  <input type="text" name="search" id="inputtop-search" value="<?php echo $search; ?>" placeholder="Tìm kiếm sản phẩm, danh mục hay thương hiệu mong muốn..." class="form-control input-lg" />
  <span class="input-group-btn" id="btn-search-top">
    <button type="button" class="btn btn-submitpage btn-lg">TÌM</button>
  </span>
</div>
<script>
  $('#inputtop-search').click(function(){
    $('#select-cattop').toggle();
  });

  $('#select-cattop').mouseleave(function(){
      $(this).hide();
  });

  $('.cat-id').click(function(){
    $('#cat_id').val($(this).attr('id'));
    $('#cat-text').html($(this).html());
  });
</script>
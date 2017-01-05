<?php echo $header; ?>
<link href="/catalog/view/theme/pav_clothes/stylesheet/customize/shopping_cart.css" rel="stylesheet" />

<div class="container p2">
<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
  <?php require( PAVO_THEME_DIR."/template/common/config_layout.tpl" );  ?>
  <?php require( PAVO_THEME_DIR."/template/common/breadcrumb.tpl" );  ?>
  <?php if ($attention) { ?>
  <div class="alert alert-info"><i class="fa fa-info-circle"></i> <?php echo $attention; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>
  <?php if ($success) { ?>
  <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>
  <?php if ($error_warning) { ?>
  <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>
  
    <div class="py3 h3 center">
    <div class="light-gray">
     <!-- react-text: 542 -->You have 
     <!-- /react-text -->
     <!-- react-text: 543 --><?php echo count($products);?> items
     <!-- /react-text -->
     <!-- react-text: 544 --> in your shopping bag.
     <!-- /react-text -->
    </div>
   </div>
   
   <div data-test="order-summary" class="h3 py1">
    Review your order
   </div>
   
   <div class="mt2 clearfix mxn3">
    <div data-test="cart-line-items" class="col-on-tb-dt col-6-on-tb-dt px3 mb3">
     <div>
      <div class="border-bottom border-dark-silver">
       <span> &nbsp;</span>
      </div>
     </div>
     <?php foreach ($products as $product): ?>
     <div class="clearfix mb1 border-bottom border-dark-silver py2">
     <?php if ($product['thumb']) { ?>
                  <a class="left mr1" href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-thumbnail" /></a>
                  <?php } ?>
      <div class="overflow-hidden h5 dark-gray p1">
       <a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
       <div class="h6 line-height-2">
        <?php if (!$product['stock']) { ?>
                  <span class="text-danger">***</span>
                  <?php } ?>
                  <?php if ($product['option']) { ?>
                  <?php foreach ($product['option'] as $option) { ?>
                  <br />
                  <small><?php echo $option['name']; ?>: <?php echo $option['value']; ?></small>
                  <?php } ?>
                  <?php } ?>
                  <?php if ($product['reward']) { ?>
                  <br />
                  <small><?php echo $product['reward']; ?></small>
                  <?php } ?>
                  <?php if ($product['recurring']) { ?>
                  <br />
                  <span class="label label-info"><?php echo $text_recurring_item; ?></span> <small><?php echo $product['recurring']; ?></small>
                  <?php } ?>
                  
        <div>Model:<?php echo $product['model']; ?></div>
        <div class="mt2 flex items-center justify-between">
        
        <div class="input-group btn-block" style="max-width: 200px;">
                    <input type="text" name="quantity[<?php echo $product['key']; ?>]" value="<?php echo $product['quantity']; ?>" size="1" class="form-control" />
                    <span class="input-group-btn">
                    <button type="submit" data-toggle="tooltip" title="<?php echo $button_update; ?>" class="button"><i class="fa fa-refresh"></i></button>
                    <button type="button" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="button" onclick="cart.remove('<?php echo $product['key']; ?>');"><i class="fa fa-times-circle"></i></button></span>
                        
        </div>
        </div>
       </div>
      </div>
     </div>
     <?php endforeach; ?>
       <img src="http://sodahair.com/image/catalog/demo/slider/cards.png">
    </div>
    <div class="col-on-tb-dt col-6-on-tb-dt px3">
      
      <?php if ($coupon || $voucher || $reward || $shipping) { ?>
     <!-- <h2><?php echo $text_next; ?></h2>
      <p><?php echo $text_next_choice; ?></p>-->
      <div class="panel-group" id="accordion"><?php echo $coupon; ?><?php echo $voucher; ?><?php echo $reward; ?><?php echo $shipping; ?></div>
      <?php } ?>
      
     <div>
      <div class="py2 border-top border-bottom border-dark-silver">
       <table class="col-12">
        <tbody>
         <?php foreach ($totals as $total) { ?>
         <tr class="h5 line-height-4">
              <td><?php echo $total['title']; ?>:</td>
              <td class="right-align medium navy"><?php echo $total['text']; ?></td>
         </tr>
         <?php } ?>
        </tbody>
       </table>
      </div>
      <!--
      <div class="py2 h2">
       <div class="flex">
        <div class="flex-auto light">
         Total
        </div>
        <div class="right-align gray">
         $178.00
        </div>
       </div>
      </div>
     </div>
     -->
     
     <div class="pb2">
      <a href="/index.php?route=payment/pp_express/express" data-test="paypal-checkout" class="btn col-12 h3 btn-large btn-primary white ">
       <div>
        <div>
         <!-- react-text: 648 -->Check out
         <!-- /react-text -->
        </div>
       </div></a>
     </div>
     <div class="h5 gray center py2">
      OR
     </div>
    <div class="pb2">
      <a href="/index.php?route=payment/pp_express/express&landingpage=Login" data-test="paypal-checkout" class="btn col-12 h3 btn-large btn-primary bg-aqua white ">
       <div>
        <div>
         <!-- react-text: 648 -->Check out with 
         <!-- /react-text -->
         <span class="medium italic">PayPal™</span>
        </div>
       </div></a>
     </div>
    </div>
   </div>
   </div>
</form>
</div>
   <!--<div class="buttons">
        <div class="pull-left"><a href="<?php echo $continue; ?>" class="button btn"><?php echo $button_shopping; ?></a></div>
        <div class="pull-right"><a href="<?php echo $checkout; ?>" class="button btn"><?php echo $button_checkout; ?></a></div>
      </div>-->
      <?php echo $content_bottom; ?>
   </section> 
<?php if( $SPAN[2] ): ?>
  <aside id="sidebar-right" class="col-md-<?php echo $SPAN[2];?>">
    <?php echo $column_right; ?>
  </aside>
<?php endif; ?></div>
</div>
<div class="border-top border-dark-silver bg-white">
          <div class="container">
          <div class="px3 my2 line-height-4">
              <div class="medium f4 gray">Need Help?</div>
              <div class="gray light f5"><span class="hide-on-tb-dt"></span><span class="hide-on-mb">+1 (646) 934-6206</span><!-- react-text: 535 --> | info@sodahair.com<!-- /react-text --></div>
            </div>
          <div class=" px3 my2 line-height-4">
              <div class="medium f4 gray">FOLLOW US</div>
              <div style="font-weight: bold; font-size: 30px; padding: 0px;"> <a href=" https://www.facebook.com/sodahairweave/" class="fb fa fa-facebook-square"></a>                                                                          <a href="https://www.instagram.com/sodahairweave/" class="twit  fa fa-linkedin-square"></a>                                                                         <a href="https://www.pinterest.com/sodahairweave/" class="gogl fa fa-pinterest-square"></a>
<a href="https://www.youtube.com/channel/UC9T-VzhgNJ3AssY9NZPD6KQ" class="fa fa-youtube-square"></a></div>
            </div>
            
          </div>
        </div>
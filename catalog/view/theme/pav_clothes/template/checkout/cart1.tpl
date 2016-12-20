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
     <!-- react-text: 543 -->2 items
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
                  <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-thumbnail" /></a>
                  <?php } ?>
      <div class="overflow-hidden h5 dark-gray p1">
       <a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
       <div class="mt1 h6 line-height-2">
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
                  
        <div>model:<?php echo $product['model']; ?></div>
        <div class="mt2 flex items-center justify-between">
        
        <div class="input-group btn-block" style="max-width: 200px;">
                    <input type="text" name="quantity[<?php echo $product['key']; ?>]" value="<?php echo $product['quantity']; ?>" size="1" class="form-control" />
                    <span class="input-group-btn">
                    <button type="submit" data-toggle="tooltip" title="<?php echo $button_update; ?>" class="button"><i class="fa fa-refresh"></i></button>
                    <button type="button" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="button" onclick="cart.remove('<?php echo $product['key']; ?>');"><i class="fa fa-times-circle"></i></button></span>
                        
        </div>
         <div class="h3">
          <div>
           <a href="#" data-test="quantity-dec" class="col">
            <svg class="stroke-white fill-dark-silver" style="width: 1.2em; height: 1.2em;">
             <use xlink:href="#counter-dec" />
            </svg></a>
           <a href="#" data-test="quantity-inc" class="col">
            <svg class="stroke-white fill-dark-silver" style="width: 1.2em; height: 1.2em;">
             <use xlink:href="#counter-inc" />
            </svg></a>
          </div>
         </div>
        </div>
       </div>
      </div>
     </div>
     <?php endforeach; ?>
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
      <a href="<?php echo $checkout; ?>" data-test="paypal-checkout" class="btn col-12 h3 btn-large btn-primary bg-aqua white ">
       <div>
        <div>
         <!-- react-text: 648 -->Check out with 
         <!-- /react-text -->
         <span class="medium italic">PayPal™</span>
        </div>
       </div></a>
     </div>
     <div class="h5 gray center py2">
      OR
     </div>
    <div class="pb2">
      <a href="/index.php?route=payment/pp_express/express" data-test="paypal-checkout" class="btn col-12 h3 btn-large btn-primary bg-aqua white ">
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
</form>
</div>

<div class="container">
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
  <div class="row"><?php if( $SPAN[0] ): ?>
    <aside id="sidebar-left" class="col-md-<?php echo $SPAN[0];?>">
      <?php echo $column_left; ?>
    </aside>
  <?php endif; ?>
   <section id="sidebar-main" class="col-md-<?php echo $SPAN[1];?>"><div id="content"><?php echo $content_top; ?>
     
            <div class="buttons" style="border:none;">
             <h1 style="float:left;"><?php echo $heading_title; ?>
        <?php if ($weight) { ?>
        &nbsp;(<?php echo $weight; ?>)
        <?php } ?>
      </h1>
        <div class="pull-right">
             <!-- PayPal Logo -->
             <table border="0" cellpadding="10" cellspacing="0" align="center"><tr><td align="center">
             <a href="/index.php?route=payment/pp_express/express" title="How PayPal Works">
                 <img src="https://www.paypalobjects.com/webstatic/en_US/i/buttons/checkout-logo-large.png" alt="Check out with PayPal" /></a>
             </td></tr></table>
             <!-- PayPal Logo -->
          </div>
      </div>
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
        <div class="table-responsive">
          <table class="table table-bordered">
            <thead>
              <tr class="table-tr" style=" font-size: 14px;">
                <td class="text-center"><?php echo $column_image; ?></td>
                <td class="text-left"><?php echo $column_name; ?></td>
                <td class="text-left"><?php echo $column_model; ?></td>
                <td class="text-left"><?php echo $column_quantity; ?></td>
                <td class="text-right"><?php echo $column_price; ?></td>
                <td class="text-right"><?php echo $column_total; ?></td>
              </tr>
            </thead>
            <tbody>
              <?php foreach ($products as $product) { ?>
              <tr>
                <td class="text-center"><?php if ($product['thumb']) { ?>
                  <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-thumbnail" /></a>
                  <?php } ?></td>
                <td class="text-left"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
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
                  <?php } ?></td>
                <td class="text-left"><?php echo $product['model']; ?></td>
                <td class="text-left"><div class="input-group btn-block" style="max-width: 200px;">
                    <input type="text" name="quantity[<?php echo $product['key']; ?>]" value="<?php echo $product['quantity']; ?>" size="1" class="form-control" />
                    <span class="input-group-btn">
                    <button type="submit" data-toggle="tooltip" title="<?php echo $button_update; ?>" class="button"><i class="fa fa-refresh"></i></button>
                    <button type="button" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="button" onclick="cart.remove('<?php echo $product['key']; ?>');"><i class="fa fa-times-circle"></i></button></span></div></td>
                <td class="text-right"><?php echo $product['price']; ?></td>
                <td class="text-right"><?php echo $product['total']; ?></td>
              </tr>
              <?php } ?>
              <?php foreach ($vouchers as $vouchers) { ?>
              <tr>
                <td></td>
                <td class="text-left"><?php echo $vouchers['description']; ?></td>
                <td class="text-left"></td>
                <td class="text-left"><div class="input-group btn-block" style="max-width: 200px;">
                    <input type="text" name="" value="1" size="1" disabled="disabled" class="form-control" />
                    <span class="input-group-btn"><button type="button" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="button" onclick="voucher.remove('<?php echo $vouchers['key']; ?>');"><i class="fa fa-times-circle"></i></button></span></div></td>
                <td class="text-right"><?php echo $vouchers['amount']; ?></td>
                <td class="text-right"><?php echo $vouchers['amount']; ?></td>
              </tr>
              <?php } ?>
            </tbody>
          </table>
        </div>
      </form>
      <?php if ($coupon || $voucher || $reward || $shipping) { ?>
     <!-- <h2><?php echo $text_next; ?></h2>
      <p><?php echo $text_next_choice; ?></p>-->
      <div class="panel-group" id="accordion"><?php echo $coupon; ?><?php echo $voucher; ?><?php echo $reward; ?><?php echo $shipping; ?></div>
      <?php } ?>
      <h2>PayPal Shipping Address</h2>
      <p>Your order will be shipped to <strong>the address in your PayPal account.</strong></p>
      <div class="row">
        <div class="col-sm-4 col-sm-offset-8">
          <table class="table table-bordered">
            <?php foreach ($totals as $total) { ?>
            <tr>
              <td class="text-right"><strong><?php echo $total['title']; ?>:</strong></td>
              <td class="text-right"><?php echo $total['text']; ?></td>
            </tr>
            <?php } ?>
          </table>
        </div>
      </div>
      <div class="buttons" style="border-top:solid 1px #e5e5e5;">
         <img src="http://sodahair.com/image/catalog/demo/slider/paypalLOGO_zps272a1a90.jpg"> <div class="pull-right">
               <!-- PayPal Logo --><table border="0" cellpadding="10" cellspacing="0" align="center">
               <tr><td align="center">
               <a href="/index.php?route=payment/pp_express/express" title="How PayPal Works">
                   <img src="https://www.paypalobjects.com/webstatic/en_US/i/buttons/checkout-logo-large.png" alt="Check out with PayPal" />
               </a>
               </td></tr>
               </table><!-- PayPal Logo -->
          </div>
      </div>
   <!--<div class="buttons">
        <div class="pull-left"><a href="<?php echo $continue; ?>" class="button btn"><?php echo $button_shopping; ?></a></div>
        <div class="pull-right"><a href="<?php echo $checkout; ?>" class="button btn"><?php echo $button_checkout; ?></a></div>
      </div>-->
      <?php echo $content_bottom; ?></div>
   </section> 
<?php if( $SPAN[2] ): ?>
  <aside id="sidebar-right" class="col-md-<?php echo $SPAN[2];?>">
    <?php echo $column_right; ?>
  </aside>
<?php endif; ?></div>
</div>
<?php echo $footer; ?> 
<?php
	$navPage = '';
	$strPageTitle = QApplication::Translate('Qualvu - ${TM_UCASE_BASENAME}');
	include_once("qualvu/app_header.inc.php");
?>
<body>
<div id="accountsMainContainer">
	<div id="projects">
		<?php $this->RenderBegin(); ?>
		<div id="navigationContainer">
			<?php $this->pnlNav->Render(); ?>
		</div>
		<div id="containerRight" style="padding:0px; border:0px solid #000; width: 100%;">
			<?php QPostMessage::DisplayMessage(); ?>
			<?php QAjaxMessage::DisplayMessage(); ?>
			<div>
				<!-- Page Content Goes Here -->
			</div>
		</div>
		<?php $this->RenderEnd(); ?>
	</div>
</div>
<?php include_once('qualvu/app_footer.inc.php'); ?>

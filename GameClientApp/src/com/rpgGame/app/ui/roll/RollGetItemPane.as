package com.rpgGame.app.ui.roll
{
	import com.game.mainCore.core.manager.LayerManager;
	import com.rpgGame.app.display2D.PopSkinUI;
	import com.rpgGame.app.manager.ItemActionManager;
	import com.rpgGame.app.utils.FaceUtil;
	import com.rpgGame.app.view.icon.IconCDFace;
	import com.rpgGame.core.manager.StarlingLayerManager;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	
	import feathers.utils.filter.GrayFilter;
	
	import gs.TweenLite;
	
	import org.mokylin.skin.app.roll.Roll_HuoDe;
	
	import starling.core.Starling;
	
	public class RollGetItemPane extends PopSkinUI
	{
		private var _clientItem:ClientItemInfo;
		private var _getSkin:Roll_HuoDe;
		private var _icon:IconCDFace;
		public function RollGetItemPane(item:ClientItemInfo):void
		{
			_clientItem = item;
			_getSkin = new Roll_HuoDe();
			_skin = _getSkin;
			super(null);
			initView();
		}
		private function initView():void
		{
			_icon = FaceUtil.creatIconCDFaceByUIAsset(_getSkin.icon,IcoSizeEnum.ICON_48,1,5,5);
			FaceUtil.SetItemGrid(_icon,_clientItem, true);
			this.x = (LayerManager.stage.stageWidth - this.width)/2;
			this.y = 200;
			TweenLite.delayedCall(1,delayFlyHandler);
			StarlingLayerManager.topUILayer.addChild(this);
		}
		private function delayFlyHandler():void
		{
			GrayFilter.gray(_icon);
			ItemActionManager.tweenItemInBag(_icon,null,completeHandler);
		}
		private function completeHandler():void
		{
			StarlingLayerManager.topUILayer.removeChild(this);
		}
		
		public static function popItem(item:ClientItemInfo):void
		{
			new RollGetItemPane(item);
		}
	}
}
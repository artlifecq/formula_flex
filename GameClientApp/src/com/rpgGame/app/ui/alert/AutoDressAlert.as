package com.rpgGame.app.ui.alert
{
	import com.rpgGame.app.utils.FaceUtil;
	import com.rpgGame.app.view.icon.DragDropItem;
	import com.rpgGame.core.manager.StarlingLayerManager;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.core.utils.UIUtil;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.info.item.EquipInfo;
	import com.rpgGame.coreData.type.item.ItemQualityType;
	
	import org.mokylin.skin.common.AutoDressEquipAlertSkin;
	
	import starling.display.DisplayObject;
	
	/**
	 * 获得装备提示自动装备功能 
	 * @author wewell
	 */	
	public class AutoDressAlert extends SkinUI
	{
		private static var _ins:AutoDressAlert;;
		
		private var skin:Object;//AutoDressEquipAlertSkin;
		private var okFCallBack:Function;
		private var closeCallBack:Function;
		private var equips:Array;
		
		public function AutoDressAlert()
		{
			//skin = new AutoDressEquipAlertSkin(); 
			super(skin);
			
			var grid:DragDropItem = FaceUtil.creatDragDropItemByUIAsset(skin.grid, IcoSizeEnum.SIZE_60);
			grid.dragAble = false;
			grid.setIconPoint(0,0);
			skin.grid = grid;
			equips = [];
		}
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			switch(target){
				case skin.btnDress:
					if(okFCallBack != null)
					{
						okFCallBack(DragDropItem(skin.grid).faceInfo);
					}
					checkShowNext();
					break;
				case skin.btnClose:
					checkShowNext();
					break;
			}
		}
		
		private function checkShowNext():void
		{
			if(equips && equips.length)
			{
				setEquip(equips.shift());
			}else{
				hide();
			}
		}
		
		public function setEquip(equip:EquipInfo):void
		{
			var grid:DragDropItem = skin.grid as DragDropItem;
			skin.lbName.htmlText=ItemQualityType.getHtmlEquipQualityEvaluteName(equip.refined_times, equip.quality, equip.name, equip.evaluate);
			FaceUtil.SetItemGrid(grid, equip);
		}
		
		public function addEquip(equip:EquipInfo):void
		{
			var len:int = equips.length;
			var eq:EquipInfo;
			for(var i:int=0; i<len; i++)
			{
				eq = equips[i];
				if(!eq)
					continue;
				if(eq.equipType != equip.equipType )
				{
					continue;
				}
				if(equip.evaluate < eq.evaluate)
				{
					return;
				}
			}
			equips.push(equip);
		}
		
		override protected function onStageResize(sw:int, sh:int):void
		{
			UIUtil.alignToStageRightBottom(this);
		}
		
		public static function show(equip:EquipInfo, onOk:Function=null):AutoDressAlert
		{
			if(!_ins)
			{
				_ins = new AutoDressAlert;
			}
			_ins.okFCallBack = onOk;
			if(_ins.stage == null)
			{
				StarlingLayerManager.appUILayer.addChild(_ins);
				UIUtil.alignToStageRightBottom(_ins);
				_ins.setEquip(equip);
			}else
			{
				_ins.addEquip(equip);
			}
			return _ins;
		}
		
		public static function hide():void
		{
			if(_ins)_ins.removeFromParent();
		}
	}
}




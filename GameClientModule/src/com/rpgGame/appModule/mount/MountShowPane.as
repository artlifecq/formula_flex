package com.rpgGame.appModule.mount
{
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.app.utils.FaceUtil;
	import com.rpgGame.app.view.icon.IconCDFace;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	import com.rpgGame.coreData.type.CharAttributeType;
	
	import feathers.core.ToggleGroup;
	import feathers.events.FeathersEventType;
	
	import org.mokylin.skin.app.zuoqi.huoquSkin;
	
	import starling.display.DisplayObject;
	import starling.events.Event;
	
	public class MountShowPane extends SkinUIPanel
	{
		private var _itemIcon:IconCDFace;
		private var _group:ToggleGroup;
		private var _numeric:GameNumericStepper;
		private var _buesses:BuessesItemInfo
		private function initView():void
		{
			_buesses = new BuessesItemInfo();
			_itemIcon =  FaceUtil.creatIconCDFaceByUIAsset(_skin.itembg,IcoSizeEnum.ICON_64);
			_group = new ToggleGroup();
			_skin.btn_yuanbao.toggleGroup = _group;
			_skin.btn_dianquan.toggleGroup = _group;
			_group.addEventListener(Event.CHANGE,useMoneyTypeHandler);
			_numeric = new GameNumericStepper();
			_numeric.addEventListener(Event.CHANGE,valueChangeHandler);
			_numeric.minValue = 1;
			_numeric.maxFun = getMaxNum;
			_numeric.setSkinInfo(_skin.btn_jian,_skin.btn_jia,_skin.max,_skin.input_txt);
		}
		
		private function valueChangeHandler():void
		{
			_skin.lab_num.text = int(_numeric.currentValue*_buesses.price).toString();
		}
		
		private function getMaxNum():int
		{
			return _buesses.getMaxNum();
		}
		private function useMoneyTypeHandler():void
		{
			var selectIndex:int = _group.selectedIndex;
			if(selectIndex==0)
			{
				_skin.yuanbao.styleName = "ui/common/tubiao/yuanbao_24.png";
				_buesses.useMoneyType = CharAttributeType.RES_GOLD;
			}else{
				_skin.yuanbao.styleName = "ui/common/tubiao/lijin_24.png";
				_buesses.useMoneyType = CharAttributeType.RES_BIND_GOLD;
			}
			var max:int = getMaxNum();
			if(max<_numeric.currentValue)
			{
				_skin.lab_num.text = int(_numeric.currentValue*_buesses.price).toString();
				_numeric.currentValue = max;
			}
		}
		
		
		public function updataItem(item:ClientItemInfo):void
		{
			_buesses.item = item;
			FaceUtil.SetItemGrid(_itemIcon,item,true);
			_itemIcon.setIconPoint(5,5);
			_skin.itemname.text = item.qItem.q_name;
			_skin.num_danjia.text = _buesses.price.toString();
			_skin.num_zuida.text = item.qItem.q_max.toString();
			_group.selectedIndex = 0;
		}
		
		private var _isAddToStage:Boolean;

		public function get isAddToStage():Boolean
		{
			return _isAddToStage;
		}
		
		override protected function onStageResize(sw:int, sh:int):void
		{
			_isAddToStage = true;
		}
		private var _skin:huoquSkin;
		public function MountShowPane():void
		{
			_skin = new huoquSkin();
			super(_skin);
			initView();
		}
		override public function hide():void
		{
			_isAddToStage = false;
			super.hide();
		}
		
		override protected function onTouchTarget(target : DisplayObject) : void
		{
			super.onTouchTarget(target);
			switch(target)
			{
				case _skin.btn_goumai:
					trace("购买")
					break;
				case _skin.btn_goumai:
					trace("充值");
					break;
			}
		}
	}
}
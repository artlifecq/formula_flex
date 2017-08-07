package com.rpgGame.appModule.hunyin
{
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.coreData.cfg.AttValueConfig;
	import com.rpgGame.coreData.type.CharAttributeType;
	
	import org.mokylin.skin.app.hunyin.HunYin_Item;
	
	public class HunYinItem extends SkinUI
	{
		private var _skin:HunYin_Item;
		public function HunYinItem()
		{
			_skin=new HunYin_Item();
			super(_skin);
			initView();
		}
		
		private function initView():void
		{
			_skin.lbNum.text="0";
			_skin.lbAdd.visible=false;
			_skin.uiUp.visible=false;
		}
		
		override protected function onShow():void
		{
			super.onShow();
			
		}
		
		override protected function onHide():void
		{
			super.onHide();
			
		}
		
		public function setData(type:int,value:int,nextValue:int):void
		{
			_skin.uiName.styleName= CharAttributeType.getAttrNameUrl(type);
			_skin.lbNum.text=AttValueConfig.getDisAttValue(type,value).toString();
			var num:int=nextValue-value;
			if(num>0)
			{
				_skin.lbAdd.text=AttValueConfig.getDisAttValue(type,num).toString();
				_skin.lbAdd.visible=true;
				_skin.uiUp.visible=true;
			}
			else
			{
				_skin.lbAdd.visible=false;
				_skin.uiUp.visible=false;
			}
		}
	}
}
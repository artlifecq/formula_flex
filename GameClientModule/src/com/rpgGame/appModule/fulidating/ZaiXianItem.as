package com.rpgGame.appModule.fulidating
{
	import com.rpgGame.app.view.icon.IconCDFace;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	
	import org.mokylin.skin.app.fulidating.Item_Zaixian;
	
	import starling.display.DisplayObject;
	
	public class ZaiXianItem extends SkinUI
	{
		private var _skin:Item_Zaixian;
		private var _ico:IconCDFace;
		public function ZaiXianItem()
		{
			_skin=new Item_Zaixian();
			super(_skin);
			_ico=new IconCDFace(IcoSizeEnum.ICON_48);
			_ico.selectImgVisible=false;
		}
		
		public function setData(online:int):void
		{
			_skin.uiName.styleName="ui/app/fulidating/word/"+online+"fen.png";
			_skin.lb_name.text="???";
		}
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			switch(target){
				case _skin.btnOK:
					reqRaffleReward();
					break;
			}
		}
		
		private function updateBtnState():void
		{
			
		}
		
		private function reqRaffleReward():void
		{
			if(_skin.btnOK.filter!=null) return;
			
		}
	}
}
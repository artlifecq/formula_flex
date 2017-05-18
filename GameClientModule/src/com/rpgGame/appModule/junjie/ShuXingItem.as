package com.rpgGame.appModule.junjie
{
	import com.gameClient.utils.HashMap;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.coreData.type.CharAttributeType;
	import com.rpgGame.coreData.utils.JunJieUtil;
	
	import org.mokylin.skin.app.beibao.junjie.ShuXing_Item;
	
	public class ShuXingItem extends SkinUI
	{
		private var _skin:ShuXing_Item;
		private var _lv:int=0;
		private var _type:int=0;
		private var _value:int=0;
		public function ShuXingItem()
		{
			_skin=new ShuXing_Item();
			super(_skin);
			_skin.uiUp.visible=false;
			_skin.lbAdd.visible=false;
		}
		
		public function setData(lv:int,type:int,value:int):void
		{
			_lv=lv;
			_type=type;
			_value=value;
			_skin.lbName.text=CharAttributeType.getCNName(_type);
			_skin.lbTotal.text=_value.toString();
//			contrastAttr(_lv);
		}
		
		public function contrastAttr(lv:int):void
		{
			if(_lv<lv)	{
				var has:HashMap=JunJieUtil.getShuXingJiaCheng(lv);
				var num:int=has.getValue(_type);
				if(num-_value>0){
					_skin.lbAdd.text="+"+(num-_value);
					_skin.uiUp.visible=true;
					_skin.lbAdd.visible=true;
				}
				else{
					_skin.uiUp.visible=false;
					_skin.lbAdd.visible=false;
				}
			}
			else{
				_skin.uiUp.visible=false;
				_skin.lbAdd.visible=false;
			}
			
		}
	}
}
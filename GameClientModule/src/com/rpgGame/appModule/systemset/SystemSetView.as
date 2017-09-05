package com.rpgGame.appModule.systemset
{
	import com.rpgGame.app.manager.DisplaySetUpManager;
	import com.rpgGame.core.ui.SkinUI;
	
	import away3d.events.Event;
	
	import feathers.controls.Radio;
	import feathers.controls.Slider;
	
	import org.mokylin.skin.app.systemSet.xitong_Skin;
	
	import starling.display.DisplayObject;
	
	public class SystemSetView extends SkinUI
	{
		private var _skin:xitong_Skin;
		
		private var arr:Array;
		
		public function SystemSetView()
		{
			_skin =new xitong_Skin();
			super(_skin);
			arr=[_skin.rdoZidong,_skin.rdoDi,_skin.rdoZhong,_skin.rdoGao];
			addEvent();
		}
		
		private function initView():void
		{
			(arr[DisplaySetUpManager.configLevel] as Radio).isSelected=true;
			_skin.sld_xuanranbeishu.maximum=100;
			_skin.sld_xuanranbeishu.minimum=0;
			_skin.sld_xuanranbeishu.value=DisplaySetUpManager.filterQuality;
			_skin.sld_kangjuchi.maximum=2;
			_skin.sld_kangjuchi.minimum=0;
			_skin.sld_kangjuchi.value=DisplaySetUpManager.viewAntiAlias/2;
			_skin.sld_dengji.maximum=2;
			_skin.sld_dengji.minimum=0;
			_skin.sld_dengji.value=DisplaySetUpManager.displayLevel;
			
			_skin.chk_huanyingxiaoguo.isSelected=DisplaySetUpManager.openPhantom;
			_skin.chk_hunhetongdao.isSelected=DisplaySetUpManager.openBlend;
			_skin.chk_zengqiangxiaoguo.isSelected=DisplaySetUpManager.openHeightEffect;
			_skin.chk_niuquxiaoguo.isSelected=DisplaySetUpManager.openHeat;
			_skin.chk_faguangxiaoguo.isSelected=DisplaySetUpManager.openGlow;
			_skin.chk_yinyingpinzhi.isSelected=DisplaySetUpManager.shadowLevel==1?true:false;
		}
		
		override protected function  onShow():void
		{
			super.onShow();
			initView();
		}
		
		private function addEvent():void
		{
			_skin.sld_xuanranbeishu.addEventListener(Event.CHANGE,changeHandler);
			_skin.sld_kangjuchi.addEventListener(Event.CHANGE,changeHandler);
			_skin.sld_dengji.addEventListener(Event.CHANGE,changeHandler);
		}
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			switch(target)
			{
				case _skin.rdoZidong:
				{
					DisplaySetUpManager.configLevel=0;
					initView();
					break;
				}
				case _skin.rdoDi:
				{
					DisplaySetUpManager.configLevel=1;
					initView();
					break;
				}
				case _skin.rdoZhong:
				{
					DisplaySetUpManager.configLevel=2;
					initView();
					break;
				}
				case _skin.rdoGao:
				{
					DisplaySetUpManager.configLevel=3;
					initView();
					break;
				}
				case _skin.chk_huanyingxiaoguo:
				{
					DisplaySetUpManager.openPhantom=_skin.chk_huanyingxiaoguo.isSelected;
					break;
				}
				case _skin.chk_hunhetongdao:
				{
					DisplaySetUpManager.openBlend=_skin.chk_hunhetongdao.isSelected;
					break;
				}
				case _skin.chk_zengqiangxiaoguo:
				{
					DisplaySetUpManager.openHeightEffect=_skin.chk_zengqiangxiaoguo.isSelected;
					break;
				}
				case _skin.chk_niuquxiaoguo:
				{
					DisplaySetUpManager.openHeat=_skin.chk_niuquxiaoguo.isSelected;
					break;
				}
				case _skin.chk_faguangxiaoguo:
				{
					DisplaySetUpManager.openGlow=_skin.chk_faguangxiaoguo.isSelected;
					break;
				}
				case _skin.chk_yinyingpinzhi:
				{
					DisplaySetUpManager.shadowLevel=_skin.chk_yinyingpinzhi.isSelected?1:0;
					break;
				}				
				case _skin.btn_ok:
				{
					saveDataHandler();
					break;
				}
			}
		}
		
		private function changeHandler(e:Event):void
		{
			if(e.target == _skin.sld_xuanranbeishu)	{
				DisplaySetUpManager.filterQuality=(e.target as Slider).value;
			}
			else if(e.target == _skin.sld_kangjuchi){
				DisplaySetUpManager.viewAntiAlias=(e.target as Slider).value;
			}
			else if(e.target == _skin.sld_dengji){
				DisplaySetUpManager.displayLevel=(e.target as Slider).value;
			}
		}
		
		private function saveDataHandler():void
		{
			DisplaySetUpManager.savaData();
		}
		
		override protected function onHide():void
		{
			super.onHide();
			saveDataHandler();
		}
	}
}
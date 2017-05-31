package com.rpgGame.appModule.junjie
{
	import com.rpgGame.app.manager.Mgr;
	import com.rpgGame.core.events.JunJieEvent;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.coreData.cfg.JunJieData;
	import com.rpgGame.netData.junjie.bean.JunJieInfo;
	
	import feathers.utils.filter.GrayFilter;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.app.beibao.junjie.JunJie_Item;
	import org.mokylin.skin.app.beibao.junjie.button.Button1jie;
	import org.mokylin.skin.app.beibao.junjie.button.Button2jie;
	import org.mokylin.skin.app.beibao.junjie.button.Button3jie;
	import org.mokylin.skin.app.beibao.junjie.button.Button4jie;
	import org.mokylin.skin.app.beibao.junjie.button.Button5jie;
	import org.mokylin.skin.app.beibao.junjie.button.Button6jie;
	import org.mokylin.skin.app.beibao.junjie.button.Button7jie;
	import org.mokylin.skin.app.beibao.junjie.button.Button8jie;
	import org.mokylin.skin.app.beibao.junjie.button.Button9jie;
	
	import starling.display.DisplayObject;
	
	public class JunJieItem extends SkinUI
	{
		private var _skin:JunJie_Item;
		private var _initX:int=0;
		private var _initY:int=0;
		
		private var _lv:int=0;
		private var _info:JunJieInfo;
		public function JunJieItem()
		{
			_skin=new JunJie_Item();
			super(_skin);
		}
		
		override protected function onShow():void
		{
			super.onShow();
			//			EventManager.addEvent(JunJieEvent.JUNJIE_CHANGE,updateInfo);
			//			EventManager.addEvent(JunJieEvent.JUNJIE_JIEGUO,updateInfo);
		}
		
		override protected function onHide():void
		{
			super.onHide();
			//			EventManager.removeEvent(JunJieEvent.JUNJIE_CHANGE,updateInfo);
			//			EventManager.removeEvent(JunJieEvent.JUNJIE_JIEGUO,updateInfo);
		}
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			switch(target){
				case _skin.btnCont:
				case _skin.icons:
					EventManager.dispatchEvent(JunJieEvent.JUNJIE_SELECT,this);
					break;
			}			
		}
		
		public function get lv():int
		{
			return _lv;
		}
		
		public function set info(value:JunJieInfo):void
		{
			_info=value;
		}
		
		public function get info():JunJieInfo
		{
			return _info;
		}
		
		public function get initX():int
		{
			return _initX;
		}
		
		public function get initY():int
		{
			return _initY;
		}
		
		public function setData(lv:int):void
		{
			_lv=lv;
			_info=Mgr.junjieMgr.getInfoById(_lv);
			setBtnSty();
			updatePanelState();
		}
		
		private function setBtnSty():void
		{
			_skin.icons.styleName = "ui/app/beibao/junjie/icon/icon1.png";
			switch(_lv)
			{
				case 1:
					_skin.btnCont.styleClass = org.mokylin.skin.app.beibao.junjie.button.Button1jie;					
					break;
				case 2:
					_skin.btnCont.styleClass = org.mokylin.skin.app.beibao.junjie.button.Button2jie;
					break;
				case 3:
					_skin.btnCont.styleClass = org.mokylin.skin.app.beibao.junjie.button.Button3jie;
					break;
				case 4:
					_skin.btnCont.styleClass = org.mokylin.skin.app.beibao.junjie.button.Button4jie;
					break;
				case 5:
					_skin.btnCont.styleClass = org.mokylin.skin.app.beibao.junjie.button.Button5jie;
					break;
				case 6:
					_skin.btnCont.styleClass = org.mokylin.skin.app.beibao.junjie.button.Button6jie;
					break;
				case 7:
					_skin.btnCont.styleClass = org.mokylin.skin.app.beibao.junjie.button.Button7jie;
					break;
				case 8:
					_skin.btnCont.styleClass = org.mokylin.skin.app.beibao.junjie.button.Button8jie;
					break;
				case 9:
					_skin.btnCont.styleClass = org.mokylin.skin.app.beibao.junjie.button.Button9jie;
					_skin.icons.styleName = "ui/app/beibao/junjie/icon/icon2.png";
					_skin.icons.x=35;
					_skin.icons.y=25;
					break;
			}
		}
		
		public function setInitPoint(pointX:int,pointY:int):void
		{
			_initX=pointX;
			_initY=pointY;
			this.x=pointX;
			this.y=pointY;
		}
		
		public function setBtnState(bool:Boolean):void
		{
			_skin.btnCont.isSelected=bool;
		}
		
		private function updatePanelState():void
		{
			if(_lv!=JunJieData.getMaxLv())
			{
				if(_lv>Mgr.junjieMgr.getActivationLv()+1)
				{
					GrayFilter.gray(this);
				}
				else this.filter=null;	
			}
		}
		
		public function updateInfo():void
		{
			_info=Mgr.junjieMgr.getInfoById(_lv);
			updatePanelState();
		}
	}
}
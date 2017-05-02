package com.rpgGame.appModule.role
{
	import com.rpgGame.app.manager.goods.ItemManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.appModule.jingmai.MeridianMainPanelExt;
	import com.rpgGame.appModule.role.interfaces.ISubPanel;
	import com.rpgGame.appModule.util.MCUtil;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.core.utils.MCUtil;
	import com.rpgGame.coreData.role.HeroData;
	
	import org.mokylin.skin.app.beibao.beibao_Skin;
	import org.mokylin.skin.app.beibao.daohang_Skin;
	import org.mokylin.skin.app.beibao.juese_Skin;
	
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;
	import starling.events.TouchEvent;
	
	/**
	 *角色面板 
	 * @author dik
	 * 
	 */
	public class RolePanel extends SkinUIPanel
	{
		public static const SUB_ROLE:String="role_panel";
		public static const SUB_MERIDIAN:String="meridian_panel";
		protected var _skin : beibao_Skin;
		
	
		private var _subRole:SubRolePanel;
		private var _subMeridian:MeridianMainPanelExt
		private var _curSub:SkinUI
		public function RolePanel()
		{
			this._skin = new beibao_Skin();
			super(_skin);
			
			initView();
		}
		
		private function initView():void
		{
			//_skin.juese.visible=true;
			_subRole=new SubRolePanel();
		}
		
		override public function show(data:*=null, openTable:String="", parentContiner:DisplayObjectContainer=null):void 
		{
			super.show(data, openTable, parentContiner);
			var sub:String=openTable;
			if (sub==""&&_curSub==null) 
			{
				sub=SUB_ROLE;
				showSubPanel(sub);
			}
			
		}
		public function showSubPanel(subType:String):void
		{
			var sub:SkinUI;
			switch(subType)
			{
				case SUB_ROLE:
				{
					sub=_subRole;
					break;
				}
				case SUB_MERIDIAN:
				{
					sub=subMeridian;
					break;
				}
				default:
				{
					sub=_subRole;
					break;
				}
			}
			if (sub==_curSub) 
			{
				return;
			}
			if (_curSub) 
			{
				MCUtil.removeSelf(_curSub as DisplayObject);
			}
			_curSub=sub;
			(_curSub as DisplayObject).x=0;
			(_curSub as DisplayObject).y=0;
			this.addChildAt(_curSub as DisplayObject,1);
		}
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			if ( target==(_skin.daohang.skin as daohang_Skin).btn_juese) 
			{
				showSubPanel(SUB_ROLE);
			}
			else if (target==(_skin.daohang.skin as daohang_Skin).btn_jingmai) 
			{
				showSubPanel(SUB_MERIDIAN);
			}
		}
	
		
		/**
		 * 当舞台尺寸变化后
		 * @param sw 舞台宽
		 * @param sh 舞台高
		 *
		 */
		override protected function onStageResize(sw : int, sh : int) : void
		{
			super.onStageResize(sw,sh);
		}
		
		override public function hide():void
		{
			super.hide();
		}

		public function get subMeridian():MeridianMainPanelExt
		{
			if (_subMeridian==null) 
			{
				_subMeridian=new MeridianMainPanelExt();
			}
			return _subMeridian;
		}
		override protected function onShow():void
		{
			super.onShow();
		}
		override protected function onHide():void
		{
			super.onHide();
			
		}
	}
}

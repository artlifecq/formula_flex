package com.rpgGame.appModule.role
{
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.appModule.jingmai.MeridianMainPanelExt;
	import com.rpgGame.appModule.junjie.JunJiePanelExt;
	import com.rpgGame.appModule.xinfa.XinFaMainPanelExt;
	import com.rpgGame.appModule.zhangong.ZhanGongPanelExt;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.core.utils.MCUtil;
	
	import org.mokylin.skin.app.beibao.beibao_Skin;
	import org.mokylin.skin.app.beibao.daohang_Skin;
	
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;
	
	
	
	/**
	 *角色面板 
	 * @author dik
	 * 
	 */
	public class RolePanel extends SkinUIPanel
	{
		public static const SUB_ROLE:String="role_panel";
		public static const SUB_MERIDIAN:String="meridian_panel";
		public static const SUB_ZHANGONG:String="zhangong_panel";
		public static const SUB_XINFA:String="xinfa_panel";
		public static const SUB_JUNJIE:String="Junjie_panel";
		protected var _skin : beibao_Skin;
		
		
		protected var _subRole:SubRolePanel;
		private var _subMeridian:MeridianMainPanelExt;
		private var _subZhanGong:ZhanGongPanelExt;
		private var _subJunJie:JunJiePanelExt;
		private var _curSub:SkinUI;
		private var _subXinFa:XinFaMainPanelExt;
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
			if (sub==""||_curSub==null) 
			{
				sub=SUB_ROLE;
				showSubPanel(sub);			
			}else{
				showSubPanel(sub);
			}			
		}
		public function showSubPanel(subType:String):void
		{
			setBtnState(subType);
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
				case SUB_ZHANGONG:
				{
					sub=subZhanGong;
					break;
				}
				case SUB_XINFA:
				{
					sub=subXinfa;
					break;
				}
				case SUB_JUNJIE:
				{
					sub=subJunJie;
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
		
		protected function setBtnState(subType:String):void
		{
			switch(subType)
			{
				case SUB_ROLE:
				{
					(_skin.daohang.skin as daohang_Skin).btn_juese.isSelected=true;
					break;
				}
				case SUB_MERIDIAN:
				{
					(_skin.daohang.skin as daohang_Skin).btn_jingmai.isSelected=true;
					break;
				}
				case SUB_ZHANGONG:
				{
					(_skin.daohang.skin as daohang_Skin).btn_zhangong.isSelected=true;
					break;
				}
				case SUB_XINFA:
				{
					(_skin.daohang.skin as daohang_Skin).btn_xinfa.isSelected=true;
					break;
				}
				case SUB_JUNJIE:
				{
					(_skin.daohang.skin as daohang_Skin).btn_junjie.isSelected=true;
					break;
				}
				default:
				{
					(_skin.daohang.skin as daohang_Skin).btn_juese.isSelected=true;
					break;
				}
			}
		}
		
		protected function set isSeeOther(value:Boolean):void
		{
			var daohang:daohang_Skin=_skin.daohang.skin as daohang_Skin;
			var i:int;
			if(value){
				for(i=0;i<daohang.elementsContent.length;i++){
					if(daohang.elementsContent[i]!=daohang.btn_juese){
						daohang.elementsContent[i].visible=false;
					}
				}
			}else{
				for(i=0;i<daohang.elementsContent.length;i++){
					daohang.elementsContent[i].visible=true;
				}
			}
			
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
			else if(target==(_skin.daohang.skin as daohang_Skin).btn_zhangong)
			{
				showSubPanel(SUB_ZHANGONG);
			}
			else if (target==(_skin.daohang.skin as daohang_Skin).btn_xinfa) 
			{
				showSubPanel(SUB_XINFA);
			}
			else if (target==(_skin.daohang.skin as daohang_Skin).btn_junjie) 
			{
				showSubPanel(SUB_JUNJIE);
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
		
		public function get subZhanGong():ZhanGongPanelExt
		{
			if(_subZhanGong==null)
			{
				_subZhanGong=new ZhanGongPanelExt();
			}
			return _subZhanGong;
		}
		
		public function get subJunJie():JunJiePanelExt
		{
			if(_subJunJie==null)
			{
				_subJunJie=new JunJiePanelExt();
			}
			return _subJunJie;
		}
		
		public function get subXinfa():XinFaMainPanelExt
		{
			if (_subXinFa==null) 
			{
				_subXinFa=new XinFaMainPanelExt();
			}
			return _subXinFa;
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

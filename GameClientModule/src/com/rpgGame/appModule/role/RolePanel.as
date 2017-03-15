package com.rpgGame.appModule.role
{
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.coreData.role.HeroData;
	
	import org.mokylin.skin.app.beibao.beibao_Skin;
	import org.mokylin.skin.app.beibao.juese_Skin;
	
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;
	
	/**
	 *角色面板 
	 * @author dik
	 * 
	 */
	public class RolePanel extends SkinUIPanel
	{
		private var _skin : beibao_Skin;
		
		private var basicView:BasicRoleView;
		private var avatarView:AvatarView;
		private var packsView:PacksView;
		private var attConstrastView:AttContrastView;
		private var _roleData:HeroData;
		
		public function RolePanel()
		{
			this._skin = new beibao_Skin();
			super(_skin);
			
			initView();
		}
		
		private function initView():void
		{
			_skin.jineng.visible=false;
			_skin.juese.visible=true;
			basicView=new BasicRoleView(_skin.juese.skin as juese_Skin);
			avatarView=new AvatarView(_skin.juese.skin as juese_Skin);
			packsView=new PacksView(_skin.juese.skin as juese_Skin);			
			attConstrastView=new AttContrastView(_skin.juese.skin as juese_Skin);
		}
		
		override public function show(data:*=null, openTable:String="", parentContiner:DisplayObjectContainer=null):void 
		{
			super.show(data, openTable, parentContiner);
			_roleData=data as HeroData;
			if(!_roleData){
				_roleData=MainRoleManager.actorInfo;
				packsView.show();
				attConstrastView.onHide();
			}else{
				packsView.onHide();
				attConstrastView.show(_roleData);
			}
			basicView.show(_roleData);
			avatarView.show(_roleData);
		}
		
		override protected function onTouchTarget(target : DisplayObject) : void {
			super.onTouchTarget(target);
			
			if(packsView.onTouchTarget(target)){
				return;
			}
			
			if(avatarView.onTouchTarget(target)){
				return;
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
			basicView.onHide();
			avatarView.onHide();
			packsView.onHide();
			attConstrastView.onHide();
		}
	}
}

package com.rpgGame.appModule.role
{
	import com.rpgGame.app.manager.goods.ItemManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.coreData.role.HeroData;
	
	import org.mokylin.skin.app.beibao.beibao_Skin;
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
		protected var _skin : beibao_Skin;
		
		protected var basicView:BasicRoleView;
		protected var avatarView:AvatarView;
		protected var packsView:PacksView;
		protected var attConstrastView:AttContrastView;
		protected var _roleData:HeroData;
		
		public function RolePanel()
		{
			this._skin = new beibao_Skin();
			super(_skin);
			
			initView();
		}
		
		private function initView():void
		{
			_skin.juese.visible=true;
			basicView=new BasicRoleView(_skin.juese.skin as juese_Skin);
			avatarView=new AvatarView(_skin.juese.skin as juese_Skin);
			packsView=new PacksView(_skin.juese.skin as juese_Skin);			
			attConstrastView=new AttContrastView(_skin.juese.skin as juese_Skin);
		}
		
		override public function show(data:*=null, openTable:String="", parentContiner:DisplayObjectContainer=null):void 
		{
			super.show(data, openTable, parentContiner);
			_roleData=MainRoleManager.actorInfo;
			attConstrastView.onHide();
			ItemManager.getBackEquip(initItem);
		}
		
		private function initItem():void
		{
			packsView.show();
			basicView.show(_roleData);
			avatarView.show(_roleData);			
		}
		
		override protected function onTouch(e:TouchEvent):void
		{
			super.onTouch(e);
			avatarView.onTouch(e);
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
